//
//  PullRequestDetailOnlineView.swift
//

import GitHubAPI
import SwiftUI

struct PullRequestDetailOnlineView: View {
  @Environment(ErrorHandle.self) var errorHandle

  let ownerID: String
  let repositoryName: String
  let pullNumber: Int

  @State var pullRequest: PullRequest? = nil

  func populate() async {
    do {
      self.pullRequest = try await GitHubAPI().pullRequest(
        ownerID: ownerID,
        repositoryName: repositoryName,
        pullNumber: pullNumber
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    let viewState = RepositoryPullRequestDetailViewState(pullRequest: pullRequest ?? .sample, commentID: nil)
    PullRequestDetailView(viewState: viewState)
      .id(self.pullRequest) // idをtaskの後につけると2重でtaskが発生してしまうので、Topで設定している
      .redacted(reason: pullRequest == nil ? .placeholder : [])
      .task {
        await populate()
      }
  }
}

#Preview {
  PullRequestDetailOnlineView(
    ownerID: "apple",
    repositoryName: "swift",
    pullNumber: 67644
  )
    .environment(ErrorHandle())
    .environment(NavigationRouter())
}
