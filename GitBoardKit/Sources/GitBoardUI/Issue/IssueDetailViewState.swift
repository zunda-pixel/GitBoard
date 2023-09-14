//
//  IssueDetailViewState.swift
//

import Foundation
import Observation
import GitHubData

protocol IssueDetailViewState: Observable {
  var issue: GitHubData.Issue { get }
  var repository: GitHubData.Repository { get }
  var comments: [GitHubData.Comment] { get }
  var _comments: [GitHubData.Comment] { get }
  func populateComments() async throws
  func populateMoreComments(id: GitHubData.Comment.ID) async throws
}

extension IssueDetailViewState {
  var comments: [GitHubData.Comment] {
    _comments.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .forward))
  }
}
