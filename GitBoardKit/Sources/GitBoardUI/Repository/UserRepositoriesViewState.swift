//
//  UserRepositoriesViewState.swift
//

import Foundation
import Observation
import GitHubKit

@Observable
final class UserRepositoriesViewState: RepositoriesViewState {
  let userID: String
  var page: Int = 1
  var _repositories: [Repository] = []
  
  init(userID: String) {
    self.userID = userID
  }
  
  func populateRepositories() async throws {
    page = 1
    
    _repositories = try await GitHubKit().repositories(
      userID: userID,
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
    let newRepositories = try await GitHubKit().repositories(
      userID: userID,
      type: .all,
      sort: .pushed,
      direction: .desc,
      perPage: 30,
      page: page
    )
    
    _repositories.append(contentsOf: newRepositories)
  }
}
