//
//  NotificationsView.swift
//

import GitHubAPI
import SwiftUI
import GitBoardData
import SwiftData

struct NotificationsView: View {
  @Environment(NavigationRouter.self) var router
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(\.modelContext) var modelContext
  @Query var notifications: [GitBoardData.Notification]
  @State var page: Int = 1
  
  func populate() async {
    do {
      page = 1

      let newNotifications = try await GitHubAPI().notifications(
        all: true,
        participating: false,
        since: nil,
        before: nil,
        perPage: 30,
        page: page
      )

      for notification in newNotifications {
        let newNotification = GitBoardData.Notification(notification: notification)
        modelContext.insert(newNotification)
      }
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  func populateMore(id: String) async {
    do {
      guard id == notifications.last?.notificationID else { return }
      page += 1

      let newNotifications = try await GitHubAPI().notifications(
        all: true,
        participating: false,
        since: nil,
        before: nil,
        perPage: 30,
        page: page
      )
      
      for notification in newNotifications {
        let newNotification = GitBoardData.Notification(notification: notification)
        modelContext.insert(newNotification)
      }
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(notifications) { notification in
        VStack(alignment: .leading, spacing: 0) {
          NotificationCell(notification: notification)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)

          Divider()
        }
        .listRow()
        .onTapGesture {
          let item: NavigationRouter.Item
          guard let stringNumber = notification.subject.url?.lastPathComponent else { return }
          guard let number = Int(stringNumber) else { return }
          switch notification.subject.type {
          case .issue:
            item = .issueDetailOnlineWithoutIssue(
              ownerID: notification.repository.owner!.userID,
              repositoryName: notification.repository.name,
              issueNumber: number
            )
          case .pullRequest:
            item = .pullDetailOnline(
              ownerID: notification.repository.owner!.userID,
              repositoryName: notification.repository.name,
              pullNumber: number
            )
          case .release:
            item = .releaseDetailOnline(
              repository: notification.repository,
              releaseID: .init(number)
            )
          case .discussion:
            item = .discussionDetailOnline(
              repository: notification.repository,
              discussionNumber: number
            )
          }

          router.items.append(item)
        }
        .task {
          await populateMore(id: notification.notificationID)
        }
      }
    }
    .listStyle(.plain)
    .task {
      await populate()
    }
    .refreshable {
      await populate()
    }
  }
}

#Preview{
  NavigationStack {
    NotificationsView()
  }
  .environment(ErrorHandle())
}
