//
//  IssueDetailOnlineView.swift
//

import GitHubAPI
import SwiftUI

struct IssueDetailOnlineView: View {
  @Environment(ErrorHandle.self) var errorHandle

  let ownerID: String
  let repositoryName: String
  let issueNumber: Int

  @State var issue: Issue?
  @State var repository: Repository?

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
  
  func populate() async {
    let ownerID = ownerID
    let repositoryName = repositoryName
    let issueNumber = issueNumber

    do {
      async let issue = try await GitHubAPI().issue(
        ownerID: ownerID,
        repositoryName: repositoryName,
        issueNumber: issueNumber
      )

      async let repository = try await GitHubAPI().repository(
        ownerID: ownerID,
        repositoryName: repositoryName
      )

      self.issue = try await issue
      self.repository = try await repository
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    let viewState = RepositoryIssueDetailViewState(
      issue: issue ?? .sample,
      repository: repository ?? .sample
    )

    IssueDetailView(viewState: viewState)
      .id(issue)
      .redacted(reason: issue == nil || repository == nil ? .placeholder : [])
      .task {
        await populate()
      }
  }
}

#Preview {
  NavigationStack {
    IssueDetailOnlineView(
      ownerID: "apple",
      repositoryName: "swift",
      issueNumber: 67815
    )
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
