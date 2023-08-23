//
//  DiscussionCell.swift
//

import Emoji
import GitHubAPI
import SwiftUI

struct DiscussionCell: View {
  let discussion: Discussion

  var body: some View {
    Label {
      HStack(alignment: .top, spacing: 10) {
        VStack(alignment: .leading, spacing: 0) {
          Text(discussion.category.name)
            .foregroundStyle(.secondary)

          Text(discussion.title)
            .font(.title3)
            .bold()

          Spacer()
          Text("\(Image(systemName: "bubble")) \(discussion.comments.count)")
            .font(.caption)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .overlay {
              Capsule()
                .stroke(.secondary, lineWidth: 1)
            }
        }

        Spacer()

        Text(discussion.createdAt, format: .relative(presentation: .named))
      }
    } icon: {
      Text(discussion.category.emoji.emojiUnescapedString)
    }
  }
}