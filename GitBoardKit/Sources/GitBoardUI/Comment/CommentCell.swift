//
//  CommentCell.swift
//

import GitHubAPI
import SwiftUI

struct CommentCell: View {
  @Environment(NavigationRouter.self) var router
  let comment: Comment
  @State var isPresentedPopOver = false

  var header: some View {
    HStack(alignment: .center, spacing: 10) {
      UserProfileImage(
        avatarURL: comment.user.avatarURL,
        type: comment.user.type
      )
      .frame(width: 40, height: 40)
      .onTapGesture {
        router.items.append(.userDetail(user: comment.user))
      }

      VStack(alignment: .leading, spacing: 5) {
        HStack(alignment: .center, spacing: 10) {
          Text(comment.user.userID)
            .bold()
            .clipShape(.rect)
            .onTapGesture {
              router.items.append(.userDetail(user: comment.user))
            }

          Text(comment.createdAt, format: .relative(presentation: .named))
            .foregroundStyle(.secondary)
            .clipShape(.rect)
            .onTapGesture {
              isPresentedPopOver.toggle()
            }
            .popover(isPresented: $isPresentedPopOver) {
              Text(comment.createdAt, format: .dateTime)
                .padding(.horizontal, 10)
                .presentationCompactAdaptation(.none)
            }
        }

        Text(comment.authorAssociation.label)
          .padding(.horizontal, 8)
          .padding(.vertical, 3)
          .overlay {
            Capsule()
              .stroke(.secondary, lineWidth: 0.1)
          }
          .font(.caption)
      }
    }
  }

  var reaction: some View {
    HStack(alignment: .center, spacing: 0) {
      if comment.reactions.eyesCount > 0 {
        Label("\(comment.reactions.eyesCount)", systemImage: "eye.circle")
      }
      if comment.reactions.heartCount > 0 {
        Label("\(comment.reactions.heartCount)", systemImage: "heart.circle")
      }
      if comment.reactions.laughCount > 0 {
        Label("\(comment.reactions.laughCount)", systemImage: "face.smiling.inverse")
      }
      if comment.reactions.confusedCount > 0 {
        Label(
          "\(comment.reactions.confusedCount)",
          systemImage: "person.crop.circle.badge.questionmark.fill")
      }
    }
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      header

      Text(comment.body)

      reaction
    }
  }
}

#Preview{
  CommentCell(comment: .sample)
}

extension AuthorAssociation {
  fileprivate var label: String {
    switch self {
    case .collaborator:
      "Collaborator"
    case .contributor:
      "Contributor"
    case .firstTimer:
      "FirstTimer"
    case .firstTimeContributor:
      "FirstTimeContributor"
    case .mannequin:
      "Mannequin"
    case .member:
      "Member"
    case .owner:
      "Owner"
    case .none:
      "None"
    }
  }
}
