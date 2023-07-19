//
//  UserRepositoriesViewState.swift
//

import Foundation
import GitHubAPI
import Observation

@Observable
final class UserRepositoriesViewState: RepositoriesViewState {
  let ownerID: String
  var page: Int = 1
  var _repositories: [Repository] = []

  init(ownerID: String) {
    self.ownerID = ownerID
  }

  func populateRepositories() async throws {
    page = 1

    _repositories = try await GitHubAPI().repositories(
      ownerID: ownerID,
      type: .all,
      sort: .pushed,
      direction: .desc,
      perPage: 30,
      page: page
    )
  }

  func populateMoreRepositories(id: Repository.ID) async throws {
    guard id == repositories.last?.id else { return }
    page += 1
    let newRepositories = try await GitHubAPI().repositories(
      ownerID: ownerID,
      type: .all,
      sort: .pushed,
      direction: .desc,
      perPage: 30,
      page: page
    )

    _repositories.append(contentsOf: newRepositories)
  }
}
