//
//  ReleasesViewState.swift
//

import Observation
import GitHubAPI
import Foundation

@Observable
final class ReleasesViewState {
  let repository: Repository
  var page: Int = 1
  var _releases: [GitHubData.Release] = []
  var releases: [GitHubData.Release] {
    _releases.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.id, order: .reverse))
  }
  
  init(repository: Repository) {
    self.repository = repository
  }
  
  func populateReleases() async throws {
    page = 1
    
    let newReleases = try await GitHubAPI().releases(
      ownerID: repository.owner!.userID,
      repositoryName: repository.name,
      perPage: 30,
      page: page
    )
    
    _releases = newReleases
  }
  
  func populateMoreReleases(id: GitHubData.Release.ID) async throws {
    guard id == releases.last?.id else { return }
    page += 1
    
    let newReleases = try await GitHubAPI().releases(
      ownerID: repository.owner!.userID,
      repositoryName: repository.name,
      perPage: 30,
      page: page
    )
    
    _releases.append(contentsOf: newReleases)
  }
}
