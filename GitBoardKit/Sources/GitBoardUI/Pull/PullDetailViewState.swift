//
//  PullDetailViewState.swift
//

import Foundation
import Observation
import Algorithms
import GitHubKit

protocol PullDetailViewState: Observable {
  var pull: Pull { get }
  var comments: [Comment] { get }
  var _comments: [Comment] { get }
  func populateComments() async throws
  func populateMoreComments(id: Comment.ID) async throws
}

extension PullDetailViewState {
  var comments: [Comment] {
    _comments.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .forward))
  }
}