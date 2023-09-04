//
//  DiscussionDetailViewState.swift
//

import Foundation
import Observation
import GitHubData
import GitBoardData

protocol DiscussionDetailViewState: Observable {
  associatedtype Discussion: DiscussionProtocol
  var repository: GitHubData.Repository { get }
  var discussion: Discussion { get }
  var comments: [GitHubData.Discussion.Comment] { get }
  var _comments: [GitHubData.Discussion.Comment] { get }
  
  func populateComments() async throws
  func populateMoreComments(id: GitHubData.Discussion.Comment.ID) async throws
}

extension DiscussionDetailViewState {
  var comments: [GitHubData.Discussion.Comment] {
    _comments.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .forward))
  }
}
