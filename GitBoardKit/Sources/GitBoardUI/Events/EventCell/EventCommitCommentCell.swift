//
//  EventCommitCommentCell.swift
//

import SwiftUI
import GitHubData

struct EventCommitCommentCell: View {
  @Environment(NavigationRouter.self) var router
  let comment: Commit.Comment
  
  var ownerID: String { comment.url.pathComponents[1] }
  var repositoryName: String { comment.url.pathComponents[2] }
  var commitID: String { comment.url.pathComponents[5] }
  
  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("\(ownerID) / \(repositoryName) #\(commitID)")
          .foregroundStyle(.secondary)
        if let body  = comment.body.split(whereSeparator: \.isNewline).first {
          MarkdownView(source: String(body))
        }
      }
    } icon: {
      Image(systemName: "bubble")
        .foregroundStyle(.blue)
    }
    .onTapGesture {
      // TODO
      //router.items.append(.comment)
    }
  }
}

