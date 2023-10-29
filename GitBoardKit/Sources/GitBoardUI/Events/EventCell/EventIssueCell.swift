//
//  EventIssueCell.swift
//

import SwiftUI
import GitHubData

struct EventIssueCell: View {
  @Environment(NavigationRouter.self) var router

  let action: String
  let issue: Issue
  
  var ownerID: String { issue.url.pathComponents[1] }
  var repositoryName: String { issue.url.pathComponents[2] }
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(ownerID) / \(repositoryName) #\(issue.number)")
          .foregroundStyle(.secondary)

        Text(issue.user.userID)
        Text(issue.title)
          .lineLimit(3)
      }
    } icon: {
      Image(systemName: "dot.circle")
        .foregroundStyle(.green)
    }
    .onTapGesture {
      if let repository = issue.repository {
        router.items.append(
          .issueDetail(
            issue: issue,
            repository: repository
          )
        )
      } else {
        router.items.append(
          .issueDetailOnlineWithoutIssue(
            ownerID: ownerID,
            repositoryName: repositoryName,
            issueNumber: issue.number
          )
        )
      }
    }
  }
}
