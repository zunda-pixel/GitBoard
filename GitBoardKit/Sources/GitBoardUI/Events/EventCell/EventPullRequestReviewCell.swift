//
//  EventPullRequestReviewCell.swift
//

import SwiftUI
import GitHubData

struct EventPullRequestReviewCell: View {
  @Environment(NavigationRouter.self) var router
  
  let action: CommentAction
  let review: PullRequest.Review
  let pullRequest: PullRequest
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(pullRequest.base.repository!.owner!.userID) / \(pullRequest.base.repository!.name) #\(pullRequest.number)")
          .foregroundStyle(.secondary)
        Text("\(review.user.userID) \(review.state)")
      }
    } icon: {
      Image(systemName: "checkmark")
        .foregroundStyle(action == .created ? .green : .purple)
    }
    .onTapGesture {
      router.items.append(.pullRequestDetail(pullRequest: pullRequest, commentID: nil))
    }
  }
}
