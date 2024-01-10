//
//  PullRequestDetailViewState.swift
//

import Algorithms
import Foundation
import GitHubAPI
import Observation

protocol PullRequestDetailViewState: Observable {
  var pullRequest: PullRequest { get }
  var comments: [Issue.Comment] { get }
  var scrollToCommentID: PullRequest.Comment.ID? { get }
  var _comments: [Issue.Comment] { get }
  func populateComments() async throws
  func populateMoreComments(id: Issue.Comment.ID) async throws
}

extension PullRequestDetailViewState {
  var comments: [Issue.Comment] {
    _comments.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .forward))
  }
}
