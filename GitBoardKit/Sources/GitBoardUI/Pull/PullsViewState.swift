//
//  PullsViewState.swift
//

import Foundation
import Observation
import Algorithms
import GitHubKit

protocol PullsViewState: Observable {
  var pulls: [Pull] { get }
  var _pulls: [Pull] { get }
  
  func populatePulls() async throws
  func populateMorePulls(id: Pull.ID) async throws
}

extension PullsViewState {
  var pulls: [Pull] {
    _pulls.lazy
      .uniqued(on: \.id)
      .sorted(using: KeyPathComparator(\.createdAt, order: .reverse))
  }
}
