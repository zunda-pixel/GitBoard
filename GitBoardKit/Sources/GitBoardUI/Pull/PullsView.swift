//
//  PullRequestsView.swift
//

import Algorithms
import GitHubAPI
import SwiftUI

struct PullsView<ViewState: PullsViewState>: View {
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

  func populateMore(id: Pull.ID) async {
    do {
      try await viewState.populateMorePulls(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(viewState.pulls) { pull in
        VStack(alignment: .leading, spacing: 0) {
          PullCell(pull: pull)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
        .listRow()
        .task {
          await populateMore(id: pull.id)
        }
        .onTapGesture {
          router.items.append(.pullDetail(pull: pull, commentID: nil))
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
    let viewState = RepositoryPullsViewState(ownerID: "apple", repositoryName: "swift")
    PullsView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
