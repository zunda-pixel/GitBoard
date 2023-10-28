//
//  IssueDetailOnlineViewState.swift
//

import Foundation
import GitHubData
import Observation

protocol IssueDetailOnlineViewState: Observable {
  var issue: Issue? { get }
  var repository: Repository? { get }
  func populate() async throws
}
