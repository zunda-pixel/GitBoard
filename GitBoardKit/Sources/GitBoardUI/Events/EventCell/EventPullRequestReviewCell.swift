//
//  EventPullRequestReviewCell.swift
//

import SwiftUI
import GitHubData

struct EventPullRequestReviewCell: View {
  @Environment(NavigationRouter.self) var router
  
  let action: String
  let review: Pull.Review
  let pull: Pull
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(pull.base.repository!.owner!.userID) / \(pull.base.repository!.name) #\(pull.number)")
          .foregroundStyle(.secondary)
        Text("\(review.user.userID) \(review.state)")
      }
    } icon: {
      Image(systemName: "checkmark")
        .foregroundStyle(action == "opened" ? .green : .purple)
    }
    .onTapGesture {
      router.items.append(.pullDetail(pull: pull, commentID: nil))
    }
  }
}
