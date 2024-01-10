//
//  PullRequestRequestsView.swift
//

import Algorithms
import GitHubAPI
import SwiftUI

struct PullRequestsView<ViewState: PullRequestsViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router

  @State var viewState: ViewState

  func populate() async {
    do {
      try await viewState.populatePulls()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  func populateMore(id: PullRequest.ID) async {
    do {
      try await viewState.populateMorePulls(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(viewState.pullRequests) { pullRequest in
        VStack(alignment: .leading, spacing: 0) {
          PullRequestCell(pullRequest: pullRequest)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
        .listRow()
        .task {
          await populateMore(id: pullRequest.id)
        }
        .onTapGesture {
          router.items.append(.pullRequestDetail(pullRequest: pullRequest, commentID: nil))
        }
      }
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
    let viewState = RepositoryPullRequestsViewState(ownerID: "apple", repositoryName: "swift")
    PullRequestsView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
