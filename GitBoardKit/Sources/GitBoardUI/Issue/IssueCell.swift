//
//  IssueCell.swift
//

import GitHubAPI
import SwiftUI

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

      VStack(alignment: .leading, spacing: 5) {
        Text(issue.title)
          .bold()

        FlowLayout(alignment: .leading, spacing: 7) {
          ForEach(issue.labels) { label in
            LabelCell(label: label)
              .bold()
              .font(.caption2)
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

#Preview{
  IssueCell(issue: .sample)
}
