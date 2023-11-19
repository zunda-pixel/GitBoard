//
//  RepositoryPullRequestsViewState.swift
//

import GitHubAPI
import SwiftUI

@Observable
final class RepositoryPullRequestsViewState: PullRequestsViewState {
  let ownerID: String
  let repositoryName: String
  var _pullRequests: [GitHubData.PullRequest] = []
  var page: Int = 1

  init(
    ownerID: String,
    repositoryName: String
  ) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
  }

  func populatePulls() async throws {
    page = 1

    let newPullRequests = try await GitHubAPI().pullRequests(
      ownerID: ownerID,
      repositoryName: repositoryName,
      state: .all,
      head: nil,
      branchName: nil,
      sort: .created,
      direction: .desc,
      perPage: 30,
      page: page
    )

    _pullRequests = newPullRequests
  }

  func populateMorePulls(id: PullRequest.ID) async throws {
    guard id == pullRequests.last?.id else { return }
    page += 1
    
    let newPullRequests = try await GitHubAPI().pullRequests(
      ownerID: ownerID,
      repositoryName: repositoryName,
      state: .all,
      head: nil,
      branchName:  nil,
      sort: .created,
      direction: .desc,
      perPage: 30,
      page: page
    )

    _pullRequests.append(contentsOf: newPullRequests)
  }
}
