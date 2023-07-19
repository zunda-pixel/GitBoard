//
//  IssuesViewState.swift
//

import Foundation
import GitHubKit
import Observation

protocol IssuesViewState: Observable {
  var ownerID: String { get }
  var repository: Repository { get }
  var issues: [Issue] { get }
  var _issues: [Issue] { get }
  func populateMoreIssues(issueID: Issue.ID) async throws
  func populateIssues() async throws
}

extension IssuesViewState {
  var issues: [Issue] {
    self._issues.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .reverse))
  }
}
