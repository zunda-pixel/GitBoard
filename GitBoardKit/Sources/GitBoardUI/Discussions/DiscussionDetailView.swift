//
//  DiscussionDetailView.swift
//

import SwiftUI
import GitHubAPI
import MarkdownUI
import Emoji

struct DiscussionDetailView: View {
  @EnvironmentObject var router: NavigationRouter
  
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
        HStack(alignment: .center, spacing: 10) {
          UserProfileImage(avatarURL: discussion.author.avatarUrl, type: .user)
            .frame(width: 40, height: 40)
          
          Text(discussion.author.login)
          
          Text(discussion.updatedAt, style: .date)
        }
        
        Markdown(discussion.body)
      }
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
          .padding(.vertical, 5)
      }
    }
  }
}
