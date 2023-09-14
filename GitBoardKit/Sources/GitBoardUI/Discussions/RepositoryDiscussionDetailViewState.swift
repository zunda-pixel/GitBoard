//
//  RepositoryDiscussionDetailViewState.swift
//

import Foundation
import GitHubAPI
import GitBoardData

@Observable
final class RepositoryDiscussionDetailViewState<Discussion: DiscussionProtocol>: DiscussionDetailViewState {
  let repository: Repository
  let discussion: Discussion
  var _comments: [GitHubData.Discussion.Comment] = []
  var endCursor: String?
  
  init(
    repository: Repository,
    discussion: Discussion
  ) {
    self.repository = repository
    self.discussion = discussion
  }
  
  func populateComments() async throws {
    let response = try await GitHubAPI().discussionComments(
      ownerID: repository.owner!.userID,
      repositoryName: repository.name,
      discussionNumber: discussion.number,
      first: 30,
      after: nil
    )

    self._comments = response.comments
    self.endCursor = response.pageInfo.endCursor
  }

  func populateMoreComments(id: GitHubData.Discussion.Comment.ID) async throws {
    guard id == comments.last?.id else { return }
    guard let endCursor else { return }

    let response = try await GitHubAPI().discussionComments(
      ownerID: repository.owner!.userID,
      repositoryName: repository.name,
      discussionNumber: discussion.number,
      first: 30,
      after: endCursor
    )

    self._comments.append(contentsOf: response.comments)
    self.endCursor = response.pageInfo.endCursor
  }
}
