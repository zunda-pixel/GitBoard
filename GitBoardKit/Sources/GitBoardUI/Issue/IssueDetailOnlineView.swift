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
  
  @State var issue: Issue? = nil

  func populate() async {
    do {
      self.issue = try await GitHubAPI().issue(
        ownerID: ownerID,
        repositoryName: repositoryName,
        issueNumber: issueNumber
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    if let issue {
      IssueDetailView(issue: issue, repository: issue.repository!)
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
