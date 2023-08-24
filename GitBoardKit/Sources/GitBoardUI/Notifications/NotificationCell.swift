//
//  NotificationCell.swift
//

import GitHubAPI
import SwiftUI

struct NotificationCell: View {
  let notification: GitHubData.Notification

  @ViewBuilder
  var stateImage: some View {
    switch notification.subject.type {
    case .issue:
      Image(systemName: "dot.circle")
        .foregroundStyle(.green)
    case .release:
      Image(systemName: "tag")
        .foregroundStyle(.blue)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    case .pullRequest:
      Image(systemName: "arrow.triangle.merge")
        .foregroundStyle(.purple)
    case .discussion:
      Image(systemName: "bubble.left.and.bubble.right")
        .foregroundStyle(.gray)
    }
  }

  @ViewBuilder
  var label: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(alignment: .center, spacing: 5) {
        Text("\(notification.repository.owner!.userID) / \(notification.repository.name)")

        switch notification.subject.type {
        case .discussion:
          //TODO
          EmptyView()
        case .issue:
          let number = notification.subject.url!.lastPathComponent
          Text("#\(number)")
        case .release:
          let number = notification.subject.url!.lastPathComponent
          Text("#\(number)")
        case .pullRequest:
          let number = notification.subject.url!.lastPathComponent
          Text("#\(number)")
        }

        Spacer()

        Text(notification.updatedAt, format: .relative(presentation: .named, unitsStyle: .spellOut))
      }
      .foregroundStyle(.secondary)
      .lineLimit(1)

      Text(notification.subject.title)
        .bold()

      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(
          avatarURL: notification.repository.owner!.avatarURL,
          type: notification.repository.owner!.type,
          roundWidth: 2
        )
        .frame(width: 20, height: 20)

        Text(notification.repository.owner!.userID)
      }
    }
  }

  var body: some View {
    Label {
      label
    } icon: {
      stateImage
    }
  }
}

#Preview{
  NotificationCell(notification: .sample)
}
