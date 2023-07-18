//
//  RepositoryPullsViewState.swift
//

import SwiftUI
import GitHubKit

@Observable
final class RepositoryPullsViewState: PullsViewState {
  let ownerID: String
  let repositoryName: String
  var _pulls: [GitHubKit.Pull] = []
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
    
    let newPulls = try await GitHubAPI().pulls(
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
    
    _pulls = newPulls
  }
  
  func populateMorePulls(id: Pull.ID) async throws {
    guard id == pulls.last?.id else { return }
    page += 1
    
    let newPulls = try await GitHubAPI().pulls(
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
    
    _pulls.append(contentsOf: newPulls)
  }
}
