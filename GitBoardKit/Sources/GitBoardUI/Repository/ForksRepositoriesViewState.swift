//
//  ForksRepositoriesViewState.swift
//

import Foundation
import Observation
import GitHubAPI

@Observable
final class ForksRepositoriesViewState: RepositoriesViewState {
  let ownerID: String
  let repositoryName: String
  var _repositories: [GitHubData.Repository] = []
  var page: Int = 1
  
  init(
    ownerID: String,
    repositoryName: String
  ) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
  }
  
  func populateRepositories() async throws {
    page = 1
    let newRepositories = try await GitHubAPI().forks(
      ownerID: ownerID,
      repositoryName: repositoryName,
      sort: .newest,
      perPage: 30,
      page: page
    )
    
    _repositories = newRepositories
  }
  
  func populateMoreRepositories(id: GitHubData.Repository.ID) async throws {
    guard id == repositories.last?.id else { return }
    page += 1
    
    let newRepositories = try await GitHubAPI().forks(
      ownerID: ownerID,
      repositoryName: repositoryName,
      sort: .newest,
      perPage: 30,
      page: page
    )
    
    _repositories.append(contentsOf: newRepositories)
  }
}
