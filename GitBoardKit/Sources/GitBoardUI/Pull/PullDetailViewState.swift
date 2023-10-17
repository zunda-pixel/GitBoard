//
//  PullDetailViewState.swift
//

import Algorithms
import Foundation
import GitHubAPI
import Observation

protocol PullDetailViewState: Observable {
  var pull: Pull { get }
  var comments: [Issue.Comment] { get }
  var _comments: [Issue.Comment] { get }
  func populateComments() async throws
  func populateMoreComments(id: Issue.Comment.ID) async throws
}

extension PullDetailViewState {
  var comments: [Issue.Comment] {
    _comments.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .forward))
  }
}
