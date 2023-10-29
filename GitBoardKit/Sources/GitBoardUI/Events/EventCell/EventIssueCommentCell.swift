//
//  EventIssueCommentCell.swift
//

import SwiftUI
import GitHubData

struct EventIssueCommentCell: View {
  @Environment(NavigationRouter.self) var router
  
  let action: String
  let issue: Issue
  let comment: Issue.Comment
  
  var ownerID: String { issue.repositoryURL.pathComponents[2] }
  var repositoryName: String { issue.repositoryURL.pathComponents[3] }
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(ownerID) / \(repositoryName) #\(issue.number)")
          .foregroundStyle(.secondary)

        Text(issue.user.userID)
        Text(issue.title)
          .lineLimit(1)
        Text(comment.body)
          .lineLimit(3)
      }
    } icon: {
      Image(systemName: "dot.circle")
        .foregroundStyle(.green)
    }
    .onTapGesture {
      let item: NavigationRouter.Item
      
      if let repository = issue.repository {
        item = .issueDetail(
          issue: issue,
          repository: repository
        )
      } else {
        item = .issueDetailOnlineWithoutIssue(
          ownerID: ownerID,
          repositoryName: repositoryName,
          issueNumber: issue.number
        )
      }

      router.items.append(item)
    }
  }
}
