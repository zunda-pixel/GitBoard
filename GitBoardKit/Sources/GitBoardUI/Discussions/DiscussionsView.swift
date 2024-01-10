//
//  DiscussionsView.swift
//

import Emoji
import GitBoardData
import GitHubAPI
import SwiftData
import SwiftUI

struct DiscussionsView: View {
  let repository: Repository
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  @Environment(\.modelContext) var modelContext
  @Query var discussions: [GitBoardData.Discussion]

  init(repository: Repository) {
    self.repository = repository
    let predicate = #Predicate<GitBoardData.Discussion> { $0.repositoryID == repository.id }
    self._discussions = .init(
      filter: predicate,
      sort: \.updatedAt,
      order: .reverse
    )
  }
  
  func populate() async {
    do {
      let discussions = try await GitHubAPI().discussions(
        ownerID: repository.owner!.userID,
        repositoryName: repository.name,
        first: 30,
        orderBy: .updatedAt,
        direction: .desc
      )

      for discussion in discussions {
        let newDiscussion = GitBoardData.Discussion(discussion: discussion, repositoryID: repository.id)
        modelContext.insert(newDiscussion)
      }

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
