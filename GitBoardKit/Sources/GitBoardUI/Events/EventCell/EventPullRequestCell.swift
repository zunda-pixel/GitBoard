//
//  EventPullRequestCell.swift
//

import SwiftUI
import GitHubData

struct EventPullRequestCell: View {
  @Environment(NavigationRouter.self) var router

  let action: RepositoryAction
  let number: Int
  let pullRequest: PullRequest
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        let repository = pullRequest.head.repository!
        Text("\(repository.owner!.userID) / \(repository.name) #\(pullRequest.number) \(pullRequest.createdAt, format: .relative(presentation: .named))")
          .foregroundStyle(.secondary)
          .lineLimit(1)
        
        Text(pullRequest.title)
          .bold()
      }
    } icon: {
      Image(systemName: "arrow.triangle.merge")
        .foregroundStyle(action == .opened ? .green : .purple)
    }
    .onTapGesture {
      router.items.append(.pullRequestDetail(pullRequest: pullRequest, commentID: nil))
    }
  }
}

#Preview {
  EventPullRequestCell(action: .closed, number: 12, pullRequest: .sample)
    .environment(NavigationRouter())
}
