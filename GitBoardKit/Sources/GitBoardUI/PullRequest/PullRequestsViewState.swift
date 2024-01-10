//
//  PullRequestsViewState.swift
//

import Algorithms
import Foundation
import GitHubAPI
import Observation

protocol PullRequestsViewState: Observable {
  var pullRequests: [PullRequest] { get }
  var _pullRequests: [PullRequest] { get }

  func populatePulls() async throws
  func populateMorePulls(id: PullRequest.ID) async throws
}

extension PullRequestsViewState {
  var pullRequests: [PullRequest] {
    _pullRequests.lazy
      .uniqued(on: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .reverse))
  }
}
