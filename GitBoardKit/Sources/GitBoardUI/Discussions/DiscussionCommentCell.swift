//
//  DiscussionCommentCell.swift
//

import GitHubAPI
import MarkdownUI
import SwiftUI

struct DiscussionCommentCell: View {
  @State var isPresentedEditDate = false

  let comment: Discussion.Comment

  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(avatarURL: comment.author.avatarUrl, type: .user)
          .frame(width: 40, height: 40)

        Text(comment.author.login)

        Text(comment.updatedAt, style: .date)

        if let lastEditedAt = comment.lastEditedAt {
          Text("edited")
            .onTapGesture {
              isPresentedEditDate.toggle()
            }
            .popover(isPresented: $isPresentedEditDate) {
              Text(lastEditedAt, format: .relative(presentation: .named))
            }
        }
      }

      Markdown(comment.body)
    }
  }
}
