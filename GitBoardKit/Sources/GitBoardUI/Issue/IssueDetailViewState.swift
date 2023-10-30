//
//  IssueDetailViewState.swift
//

import Foundation
import Observation
import GitHubData

protocol IssueDetailViewState: Observable {
  var issue: GitHubData.Issue { get }
  var repository: GitHubData.Repository { get }
  var comments: [GitHubData.Issue.Comment] { get }
  var _comments: [GitHubData.Issue.Comment] { get }
  func populateComments() async throws
  func populateMoreComments(id: GitHubData.Issue.Comment.ID) async throws
}

extension IssueDetailViewState {
  var comments: [GitHubData.Issue.Comment] {
    _comments.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .forward))
  }
}
