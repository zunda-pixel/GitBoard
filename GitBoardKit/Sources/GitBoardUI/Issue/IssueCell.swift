//
//  IssueCell.swift
//

import SwiftUI
import GitHubKit

struct IssueCell: View {
  let issue: Issue
  
  @ViewBuilder
  func issueStatus(status: Issue.State, hasPullRequest: Bool) -> some View {
    switch status {
    case .closed:
      if hasPullRequest {
        Image(systemName: "checkmark.circle")
          .foregroundStyle(.purple)
      } else {
        Image(systemName: "slash.circle")
          .foregroundStyle(.secondary)
      }
    case .open:
      Image(systemName: "dot.circle")
        .foregroundStyle(.green)
    }
  }
  
  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      issueStatus(status: issue.state, hasPullRequest: issue.pullRequest != nil)
      
      VStack(alignment: .leading, spacing: 5)  {
        Text(issue.title)
          .bold()
        
        FlowLayout(alignment: .leading, spacing: 5) {
          ForEach(issue.labels) { label in
            IssueLabel(label: label)
              .bold()
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(
        issue.updatedAt,
        format: .relative(presentation: .named, unitsStyle: .narrow)
      )
      .foregroundStyle(.secondary)
    }
  }
}

struct IssueCell_Preview: PreviewProvider {
  static var previews: some View {
    IssueCell(issue: .sample)
  }
}
