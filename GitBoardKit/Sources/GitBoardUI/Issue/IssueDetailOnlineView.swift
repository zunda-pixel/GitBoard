//
//  IssueDetailOnlineView.swift
//

import GitHubAPI
import SwiftUI

struct IssueDetailOnlineView<ViewState: IssueDetailOnlineViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @State var viewState: ViewState

  var body: some View {
    let viewState = RepositoryIssueDetailViewState(
      issue: viewState.issue ?? .sample,
      repository: viewState.repository ?? .sample
    )

    IssueDetailView(viewState: viewState)
      .id(viewState.issue)
      .redacted(reason: self.viewState.issue == nil || self.viewState.repository == nil ? .placeholder : [])
      .task {
        do {
          try await self.viewState.populate()
        } catch let newError {
          self.errorHandle.error = .init(error: newError)
        }
      }
  }
}

#Preview {
  NavigationStack {
    let viewState = RepositoryIssueDetailOnlineViewState(
      ownerID: "apple",
      repositoryName: "swift",
      issueNumber: 67815
    )
    IssueDetailOnlineView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
