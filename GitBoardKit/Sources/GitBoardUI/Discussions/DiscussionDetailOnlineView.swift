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
        discussionNumber: discussionNumber
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    let viewState = RepositoryDiscussionDetailViewState(
      repository: repository,
      discussion: discussion ?? .sample
    )
    DiscussionDetailView(viewState: viewState)
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
