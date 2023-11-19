//
//  PullRequestDetailView.swift
//

import Algorithms
import GitHubAPI
import SwiftUI

struct PullRequestDetailView<ViewState: PullRequestDetailViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router

  @State var viewState: ViewState

  var repository: some View {
    HStack(alignment: .center, spacing: 10) {
      let repository = viewState.pullRequest.base.repository!
      IconRepositoryUserName(
        owner: repository.owner!,
        repository: repository,
        imageSize: 40
      )

      Text("#\(viewState.pullRequest.number)")
        .foregroundStyle(.secondary)
    }
  }

  @ViewBuilder
  var pullState: some View {
    switch viewState.pullRequest.state {
    case .open:
      Label("Open", systemImage: "arrow.triangle.swap")
        .labelView(color: .green)
    case .closed:
      if viewState.pullRequest.mergedAt != nil {
        Label("Merged", systemImage: "arrow.triangle.merge")
          .labelView(color: .purple)
      } else {
        Label("Closed", systemImage: "arrow.triangle.pull")
          .labelView(color: .red)
      }
    }
  }

  @MainActor
  @ViewBuilder
  var merge: some View {
    if let head = viewState.pullRequest.head.label,
      let base = viewState.pullRequest.base.label
    {
      HStack(alignment: .center, spacing: 0) {
        Text(head)
          .labelView(color: .blue)
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: viewState.pullRequest.head.repository!))
          }

        Image(systemName: "arrow.right")
          .foregroundStyle(.secondary)

        Text(base)
          .labelView(color: .blue)
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: viewState.pullRequest.base.repository!))
          }
      }
    }
  }

  @MainActor
  var header: some View {
    VStack(alignment: .leading, spacing: 10) {
      repository
        .font(.caption)

      MarkdownView(source: viewState.pullRequest.title)
        .fixedSize(horizontal: false, vertical: true)
        .bold()

      ScrollView(.horizontal) {
        LazyHStack(alignment: .center, spacing: 10) {
          pullState
          merge
        }
      }
      .scrollIndicators(.hidden)
      .font(.caption)

      FlowLayout(alignment: .center, spacing: 10) {
        ForEach(viewState.pullRequest.labels) { label in
          LabelCell(label: label)
        }
      }
      .font(.caption)
    }
  }

  func populate() async {
    do {
      try await viewState.populateComments()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  func populateMore(id: Issue.Comment.ID) async {
    do {
      try await viewState.populateMoreComments(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  @ViewBuilder
  var comments: some View {
    ForEach(viewState.comments) { comment in
      VStack(alignment: .leading, spacing: 0) {
        CommentCell(comment: comment)
          .padding(10)
          .frame(maxWidth: .infinity, alignment: .leading)

        Divider()
      }
      .listRow()
      .task {
        await populateMore(id: comment.id)
      }
    }
  }

  var body: some View {
    ScrollViewReader { reader in
      List {
        VStack(alignment: .leading, spacing: 0) {
          header
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
        .listRow()
        
        if let body = viewState.pullRequest.body {
          VStack(alignment: .leading, spacing: 0) {
            MarkdownView(source: body)
              .padding(10)
              .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
          }
          .listRow()
        }
        
        comments
      }
      .listStyle(.plain)
      .refreshable {
        await populate()
        
        if let scrollToCommentID = viewState.scrollToCommentID {
          reader.scrollTo(scrollToCommentID)
        }
      }
    }
    .task {
      await populate()
    }
  }
}

#Preview {
  NavigationStack {
    let viewState = RepositoryPullRequestDetailViewState(pullRequest: .sample, commentID: nil)
    PullRequestDetailView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}

extension View {
  fileprivate func labelView(color: Color) -> some View {
    self
      .padding(.horizontal, 10)
      .padding(.vertical, 5)
      .background {
        Capsule()
          .foregroundStyle(color.opacity(0.2))
      }
      .foregroundStyle(color)
  }
}
