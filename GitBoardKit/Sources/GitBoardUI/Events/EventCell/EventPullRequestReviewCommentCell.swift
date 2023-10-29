//
//  EventPullRequestReviewCommentCell.swift
//

import SwiftUI
import GitHubData

struct EventPullRequestReviewCommentCell: View {
  @Environment(NavigationRouter.self) var router

  let action: String
  let comment: Pull.Comment
  let pull: Pull
  
  var ownerID: String { pull.base.repository!.owner!.userID }
  var repositoryName: String { pull.base.repository!.name }
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(ownerID) / \(repositoryName) #\(pull.number)")
          .foregroundStyle(.secondary)
        Text("Comment \(action) by \(comment.user.userID)")
      }
    } icon: {
      Image(systemName: "bubble")
        .foregroundStyle(.blue)
    }
    .onTapGesture {
      router.items.append(.pullDetail(pull: pull, commentID: comment.id))
    }
  }
}
