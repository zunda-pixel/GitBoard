//
//  DiscussionDetailOnlineView.swift
//

import SwiftUI
import GitHubAPI

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
      .redacted(reason: discussion == nil ? .placeholder : [])
      .task {
        await populate()
      }
  }
}
