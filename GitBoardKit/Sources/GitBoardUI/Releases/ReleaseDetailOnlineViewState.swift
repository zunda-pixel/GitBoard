//
//  ReleaseDetailOnlineViewState.swift
//

import Foundation
import Observation
import GitHubData

protocol ReleaseDetailOnlineViewState: Observable {
  var repository: Repository? { get }
  var release: Release? { get }
  func populate() async throws
}
