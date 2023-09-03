//
//  RepositoryDiscussionDetailViewState.swift
//

import Foundation
import GitHubData
import GitBoardData

@Observable
final class RepositoryDiscussionDetailViewState<Discussion: DiscussionProtocol>: DiscussionDetailViewState {
  let repository: Repository
  let discussion: Discussion
  var comments: [GitHubData.Discussion.Comment] = []
  
  init(
    repository: Repository,
    discussion: Discussion
  ) {
    self.repository = repository
    self.discussion = discussion
    self.comments = comments
  }
}
