//
//  DiscussionDetailView.swift
//

import Emoji
import GitBoardData
import GitHubAPI
import MarkdownUI
import SwiftUI

struct DiscussionDetailView<ViewState: DiscussionDetailViewState>: View {
  @Environment(NavigationRouter.self) var router
  @State var viewState: ViewState
  
  @ViewBuilder
  var header: some View {
    HStack(alignment: .center, spacing: 10) {
      UserProfileImage(
        avatarURL: viewState.repository.owner!.avatarURL,
        type: viewState.repository.owner!.type
      )
      .frame(width: 15, height: 15)
      .onTapGesture {
        router.items.append(.userDetail(user: viewState.repository.owner!))
      }

      HStack(alignment: .center, spacing: 3) {
        Text(viewState.repository.owner!.userID)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.userDetail(user: viewState.repository.owner!))
          }

        Text("/")
          .foregroundStyle(.secondary)

        Text(viewState.repository.name)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: viewState.repository))
          }
      }
    }
    .font(.caption)
  }

  var body: some View {
    List {
      VStack(alignment: .leading, spacing: 20) {
        Text(viewState.discussion.title)
          .font(.title)
          .bold()
        HStack(alignment: .center, spacing: 4) {
          Text(viewState.discussion.category.emoji.emojiUnescapedString)
          Text(viewState.discussion.category.name)
        }
        .bold()
        .foregroundStyle(.secondary)
        .padding(.horizontal, 7)
        .padding(.vertical, 3)
        .background {
          RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(.ultraThinMaterial)
        }

        Divider()
      }
      .listRow()

      VStack(alignment: .leading, spacing: 0) {
        if let author = viewState.discussion.author {
          HStack(alignment: .center, spacing: 10) {
            UserProfileImage(avatarURL: author.avatarUrl, type: .user)
              .frame(width: 40, height: 40)

            Text(author.login)

            Text(viewState.discussion.updatedAt, style: .date)
          }
        }

        Markdown(viewState.discussion.body)
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .listRow()

      ForEach(viewState.comments) { comment in
        VStack(alignment: .leading, spacing: 0) {
          Divider()
          DiscussionCommentCell(comment: comment)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)

          Divider()
        }
        .listRow()
      }
    }
    .listStyle(.plain)
  }
}

#Preview {
  NavigationStack {
    let viewState = RepositoryDiscussionDetailViewState(repository: .sample, discussion: GitHubData.Discussion.sample)
    DiscussionDetailView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
