//
//  PullDetailView.swift
//

import Algorithms
import GitHubKit
import SwiftUI

struct PullDetailView<ViewState: PullDetailViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router

  @State var viewState: ViewState

  var repository: some View {
    HStack(alignment: .center, spacing: 10) {
      let repository = viewState.pull.base.repository!
      UserProfileImage(
        avatarURL: repository.owner!.avatarURL,
        type: repository.owner!.type
      )
      .frame(width: 40, height: 40)

      Text("\(repository.name) / \(repository.owner!.userID)")

      Text("#\(viewState.pull.number)")
        .foregroundStyle(.secondary)
    }
  }

  @ViewBuilder
  var pullState: some View {
    switch viewState.pull.state {
    case .open:
      Label("Open", systemImage: "arrow.triangle.swap")
        .labelView(color: .green)
    case .closed:
      if viewState.pull.mergedAt != nil {
        Label("Merged", systemImage: "arrow.triangle.merge")
          .labelView(color: .purple)
      } else {
        Label("Closed", systemImage: "arrow.triangle.pull")
          .labelView(color: .red)
      }
    }
  }

  @ViewBuilder
  var merge: some View {
    if let head = viewState.pull.head.label,
      let base = viewState.pull.base.label
    {
      HStack(alignment: .center, spacing: 0) {
        Text(head)
          .labelView(color: .blue)
          .clipShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: viewState.pull.head.repository!))
          }

        Image(systemName: "arrow.right")
          .foregroundStyle(.secondary)

        Text(base)
          .labelView(color: .blue)
          .clipShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: viewState.pull.base.repository!))
          }
      }
    }
  }

  var header: some View {
    VStack(alignment: .leading, spacing: 10) {
      repository
        .font(.caption)

      Text(viewState.pull.title)
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
        ForEach(viewState.pull.labels) { label in
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

  func populateMore(id: Comment.ID) async {
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
    List {
      VStack(alignment: .leading, spacing: 0) {
        header
          .padding(10)
          .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
      }
      .listRow()

      comments
    }
    .listStyle(.plain)
    .task {
      await populate()
    }
    .refreshable {
      await populate()
    }
  }
}

#Preview{
  NavigationStack {
    let viewState = RepositoryPullDetailViewState(pull: .sample)
    PullDetailView(viewState: viewState)
  }
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
