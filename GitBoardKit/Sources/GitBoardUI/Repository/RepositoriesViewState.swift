//
//  RepositoriesViewState.swift
//

import Foundation
import GitHubAPI
import Observation

protocol RepositoriesViewState: Observable {
  var repositories: [Repository] { get }
  var _repositories: [Repository] { get }

  func populateMoreRepositories(id: Repository.ID) async throws
  func populateRepositories() async throws
}

extension RepositoriesViewState {
  var repositories: [Repository] {
    self._repositories.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.pushedAt, order: .reverse))
  }
}
