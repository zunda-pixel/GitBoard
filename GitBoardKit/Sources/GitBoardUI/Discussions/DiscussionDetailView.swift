//
//  DiscussionDetailView.swift
//

import Emoji
import GitHubAPI
import MarkdownUI
import SwiftUI
import GitBoardData

struct DiscussionDetailView<Discussion: DiscussionProtocol>: View {
  @Environment(NavigationRouter.self) var router

  let repository: Repository
  let discussion: Discussion

  @ViewBuilder
  var header: some View {
    HStack(alignment: .center, spacing: 10) {
      UserProfileImage(
        avatarURL: repository.owner!.avatarURL,
        type: repository.owner!.type
      )
      .frame(width: 15, height: 15)
      .onTapGesture {
        router.items.append(.userDetail(user: repository.owner!))
      }

      HStack(alignment: .center, spacing: 3) {
        Text(repository.owner!.userID)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.userDetail(user: repository.owner!))
          }

        Text("/")
          .foregroundStyle(.secondary)

        Text(repository.name)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: repository))
          }
      }
    }
    .font(.caption)
  }

  var body: some View {
    List {
      VStack(alignment: .leading, spacing: 20) {
        Text(discussion.title)
          .font(.title)
          .bold()
        HStack(alignment: .center, spacing: 4) {
          Text(discussion.category.emoji.emojiUnescapedString)
          Text(discussion.category.name)
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
        if let author = discussion.author {
          HStack(alignment: .center, spacing: 10) {
            UserProfileImage(avatarURL: author.avatarUrl, type: .user)
              .frame(width: 40, height: 40)

            Text(author.login)

            Text(discussion.updatedAt, style: .date)
          }
        }

        Markdown(discussion.body)
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .listRow()

      ForEach(discussion.comments) { comment in
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

#Preview{
  DiscussionDetailView(repository: .sample, discussion: GitHubData.Discussion.sample)
}
