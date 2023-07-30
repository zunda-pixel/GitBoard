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
  
  @State var issue: (Issue, Repository)? = nil

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
      
      self.issue  = try await (issue, repository)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    if let issue {
      IssueDetailView(issue: issue.0, repository: issue.1)
    } else {
      ProgressView()
        .task {
          await populate()
        }
    }
  }
}

#Preview{
  IssueCell(issue: .sample)
}
