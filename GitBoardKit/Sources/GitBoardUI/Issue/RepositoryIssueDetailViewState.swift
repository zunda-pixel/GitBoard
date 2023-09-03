//
//  RepositoryIssueDetailViewState.swift
//

import Foundation
import Observation
import GitHubAPI

@Observable
final class RepositoryIssueDetailViewState: IssueDetailViewState {
  let issue: GitHubData.Issue
  let repository: GitHubData.Repository
  var _comments: [GitHubData.Comment] = []
  var page = 1
  
  init(
    issue: GitHubData.Issue,
    repository: GitHubData.Repository
  ) {
    self.issue = issue
    self.repository = repository
  }
  
  func populateComments() async throws {
    self.page = 1
    
    self._comments = try await GitHubAPI().comments(
      ownerID: self.repository.owner!.userID,
      repositoryName: self.repository.name,
      issueNumber: self.issue.number
    )
  }
  
  func populateMoreComments(id: GitHubData.Comment.ID) async throws {
    guard id == self.comments.last?.id else { return }
    self.page += 1

    let newComments = try await GitHubAPI().comments(
      ownerID: self.repository.owner!.userID,
      repositoryName: self.repository.name,
      issueNumber: self.issue.number,
      perPage: 30,
      page: 1
    )

    self._comments.append(contentsOf: newComments)
  }
}
