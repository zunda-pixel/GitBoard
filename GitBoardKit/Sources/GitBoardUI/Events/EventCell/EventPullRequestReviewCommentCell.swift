//
//  EventPullRequestReviewCommentCell.swift
//

import SwiftUI
import GitHubData

struct EventPullRequestReviewCommentCell: View {
  @Environment(NavigationRouter.self) var router

  let action: CommentAction
  let comment: PullRequest.Comment
  let pullRequest: PullRequest

  var ownerID: String { pullRequest.base.repository!.owner!.userID }
  var repositoryName: String { pullRequest.base.repository!.name }

  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(ownerID) / \(repositoryName) #\(pullRequest.number)")
          .foregroundStyle(.secondary)
        Text("Comment \(action.rawValue) by \(comment.user.userID)")
      }
    } icon: {
      Image(systemName: "bubble")
        .foregroundStyle(.blue)
    }
    .onTapGesture {
      router.items.append(.pullRequestDetail(pullRequest: pullRequest, commentID: comment.id))
    }
  }
}
