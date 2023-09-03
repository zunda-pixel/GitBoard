//
//  DiscussionDetailOnlineView.swift
//

import GitHubAPI
import SwiftUI

struct DiscussionDetailOnlineView: View {
  @Environment(ErrorHandle.self) var errorHandle

  let repository: Repository
  let discussionNumber: Int

  @State var discussion: Discussion? = nil

  func populate() async {
    do {
      self.discussion = try await GitHubAPI().discussion(
        ownerID: repository.owner!.userID,
        repositoryName: repository.name,
        discussionNumber: discussionNumber,
        itemLast: 100
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    DiscussionDetailView(repository: repository, discussion: discussion ?? .sample)
      .id(discussion)
      .redacted(reason: discussion == nil ? .placeholder : [])
      .task {
        await populate()
      }
  }
}

#Preview {
  NavigationStack {
    DiscussionDetailOnlineView(
      repository: .nodejs,
      discussionNumber: 36423
    )
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
