//
//  RepositoryPullDetailViewState.swift
//

import SwiftUI
import GitHubKit

@Observable
final class RepositoryPullDetailViewState: PullDetailViewState {
  let pull: Pull
  var _comments: [Comment] = []
  var page: Int = 1
  
  init(pull: Pull) {
    self.pull = pull
  }
  
  func populateComments() async throws {
    page = 1
    let userID = pull.base.repository!.owner!.userID
    let repositoryName = pull.base.repository!.name
    let newComments = try await GitHubAPI().comments(
      ownerID: userID,
      repositoryName: repositoryName,
      pullNumber: pull.number,
      perPage: 30,
      page: 1
    )
    
    _comments = newComments
  }
  
  func populateMoreComments(id: GitHubKit.Comment.ID) async throws {
    guard id == comments.last?.id else { return }
    page += 1
    
    let userID = pull.base.repository!.owner!.userID
    let repositoryName = pull.base.repository!.name
    let newComments = try await GitHubAPI().comments(
      ownerID: userID,
      repositoryName: repositoryName,
      pullNumber: pull.number,
      perPage: 30,
      page: 1
    )
    
    _comments.append(contentsOf: newComments)
  }
}
