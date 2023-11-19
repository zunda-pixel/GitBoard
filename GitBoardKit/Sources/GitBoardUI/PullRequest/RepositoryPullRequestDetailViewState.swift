//
//  RepositoryPullRequestDetailViewState.swift
//

import GitHubAPI
import SwiftUI

@Observable
final class RepositoryPullRequestDetailViewState: PullRequestDetailViewState {
  let pullRequest: PullRequest
  let scrollToCommentID: PullRequest.Comment.ID?

  var _comments: [Issue.Comment] = []
  var page: Int = 1

  init(pullRequest: PullRequest, commentID: PullRequest.Comment.ID?) {
    self.pullRequest = pullRequest
    self.scrollToCommentID = commentID
  }

  func populateComments() async throws {
    page = 1
    let userID = pullRequest.base.repository!.owner!.userID
    let repositoryName = pullRequest.base.repository!.name
    let newComments = try await GitHubAPI().comments(
      ownerID: userID,
      repositoryName: repositoryName,
      pullNumber: pullRequest.number,
      perPage: 30,
      page: 1
    )

    _comments = newComments
  }

  func populateMoreComments(id: GitHubData.Issue.Comment.ID) async throws {
    guard id == comments.last?.id else { return }
    page += 1

    let userID = pullRequest.base.repository!.owner!.userID
    let repositoryName = pullRequest.base.repository!.name
    let newComments = try await GitHubAPI().comments(
      ownerID: userID,
      repositoryName: repositoryName,
      pullNumber: pullRequest.number,
      perPage: 30,
      page: 1
    )

    _comments.append(contentsOf: newComments)
  }
}
