//
//  DiscussionsView.swift
//

import Emoji
import GitHubAPI
import MarkdownUI
import SwiftUI

struct DiscussionsView: View {
  let repository: Repository
  @State var discussions: [Discussion] = []
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router

  func populate() async {
    do {
      self.discussions = try await GitHubAPI().discussions(
        ownerID: repository.owner!.userID,
        repositoryName: repository.name,
        last: 100,
        orderBy: .updatedAt,
        direction: .desc
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(discussions) { discussion in
        VStack(alignment: .leading, spacing: 0) {
          DiscussionCell(discussion: discussion)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)

          Divider()
        }
        .listRow()
        .onTapGesture {
          router.items.append(
            .discussionDetail(
              repository: repository,
              discussion: discussion
            )
          )
        }
      }
    }
    .task {
      await populate()
    }
    .refreshable {
      await populate()
    }
  }
}
