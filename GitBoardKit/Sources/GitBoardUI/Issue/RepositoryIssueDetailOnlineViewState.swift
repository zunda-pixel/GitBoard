//
//  RepositoryIssueDetailOnlineViewState.swift
//

import Foundation
import Observation
import GitHubAPI

@Observable
final class RepositoryIssueDetailOnlineViewState: IssueDetailOnlineViewState, Sendable {
  let ownerID: String
  let repositoryName: String
  let issueNumber: Int

  var issue: Issue?
  var repository: Repository?

  init(ownerID: String, repositoryName: String, issueNumber: Int) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
    self.issueNumber = issueNumber
  }

  init(ownerID: String, repositoryName: String, issue: Issue) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
    self.issueNumber = issue.number
    self.issue = issue
  }

  init(repository: Repository, issue: Issue) {
    self.ownerID = repository.owner!.userID
    self.repositoryName = repository.name
    self.issueNumber = issue.number
    self.repository = repository
    self.issue = issue
  }

  func populateIssue() async throws -> Issue {
    if let issue { return issue }
    
    return try await GitHubAPI().issue(
     ownerID: ownerID,
     repositoryName: repositoryName,
     issueNumber: issueNumber
   )
  }

  func populateRepository() async throws -> Repository {
    if let repository { return repository }
    
    return try await GitHubAPI().repository(
      ownerID: ownerID,
      repositoryName: repositoryName
    )
  }

  func populate() async throws {
    async let issue = try await self.populateIssue()
    async let repository = try await populateRepository()

    self.issue = try await issue
    self.repository = try await repository
  }
}
