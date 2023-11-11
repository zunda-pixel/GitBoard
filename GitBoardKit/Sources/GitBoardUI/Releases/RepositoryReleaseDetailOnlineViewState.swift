//
//  RepositoryReleaseDetailOnlineViewState.swift
//

import Foundation
import Observation
import GitHubAPI

@Observable
final class RepositoryReleaseDetailOnlineViewState: ReleaseDetailOnlineViewState, Sendable {
  let ownerID: String
  let repositoryName: String
  let releaseID: Release.ID

  var repository: Repository?
  var release: Release?
  
  init(ownerID: String, repositoryName: String, releaseID: Release.ID) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
    self.releaseID = releaseID
  }
  
  init(repository: Repository, release: Release) {
    self.ownerID = repository.owner!.userID
    self.repositoryName = repository.name
    self.releaseID = release.id
    self.repository = repository
    self.release = release
  }
  
  init(ownerID: String, repositoryName: String, release: Release) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
    self.releaseID = release.id
    self.release = release
  }
  
  init(repository: Repository, releaseID: Release.ID) {
    self.ownerID = repository.owner!.userID
    self.repositoryName = repository.name
    self.releaseID = releaseID
    self.repository = repository
  }
  
  func populateRepository() async throws -> Repository {
    if let repository { return repository }
    
    return try await GitHubAPI().repository(
      ownerID: ownerID,
      repositoryName: repositoryName
    )
  }
  
  func populateRelease() async throws -> Release {
    if let release { return release }
    
    return try await GitHubAPI().release(
      ownerID: ownerID,
      repositoryName: repositoryName,
      releaseID: releaseID.rawValue
    )
  }
  
  func populate() async throws {
    async let repository = try await populateRepository()
    async let release = try await populateRelease()

    self.repository = try await repository
    self.release = try await release
  }
}
