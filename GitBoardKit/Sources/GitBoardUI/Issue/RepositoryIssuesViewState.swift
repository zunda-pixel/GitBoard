//
//  RepositoryIssuesViewState.swift
//

import GitHubAPI
import SwiftUI

@Observable
final class RepositoryIssuesViewState: IssuesViewState {
  let ownerID: String
  let repository: Repository
  var _issues: [Issue] = []
  var page: Int = 1

  init(ownerID: String, repository: Repository) {
    self.ownerID = ownerID
    self.repository = repository
  }

  func populateMoreIssues(issueID: Issue.ID) async throws {
    guard issueID == issues.last?.id else { return }
    page += 1

    let newIssues = try await GitHubAPI().issues(
      ownerID: ownerID,
      repositoryName: repository.name,
      state: .all,
      sort: .created,
      direction: .desc,
      perPage: 30,
      page: page
    )

    _issues.append(contentsOf: newIssues)
  }

  func populateIssues() async throws {
    page = 1

    _issues = try await GitHubAPI().issues(
      ownerID: ownerID,
      repositoryName: repository.name,
      state: .all,
      sort: .created,
      direction: .desc,
      perPage: 30,
      page: page
    )
  }
}

#Preview{
  NavigationStack {
    let viewState = RepositoryIssuesViewState(ownerID: "apple", repository: .sample)
    IssuesView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
