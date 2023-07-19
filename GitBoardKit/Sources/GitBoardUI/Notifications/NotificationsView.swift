//
//  NotificationsView.swift
//

import SwiftUI
import GitHubAPI

@Observable
final class NotificationsViewState {
  var _notifications: [GitHubData.Notification] = []
  var notifications: [GitHubData.Notification] {
    _notifications.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.id, order: .reverse))
  }
  
  var page: Int = 1
  
  func populateNotifications() async throws {
    page = 1
    
    let newNotifications = try await GitHubAPI().notifications(
      all: true,
      participating: false,
      since: nil,
      before: nil,
      perPage: 30,
      page: page
    )
    
    _notifications = newNotifications
  }
  
  func populateMoreNotifications(id: GitHubData.Notification.ID) async throws {
    guard id == notifications.last?.id else { return }
    page += 1
    
    let newNotifications = try await GitHubAPI().notifications(
      all: true,
      participating: false,
      since: nil,
      before: nil,
      perPage: 30,
      page: page
    )
    
    _notifications.append(contentsOf: newNotifications)
  }
}

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
    }
  }
  
  @ViewBuilder
  var label: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("\(notification.repository.owner!.userID) / \(notification.repository.name)")
        .foregroundStyle(.secondary)
      
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


struct NotificationsView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @State var viewState: NotificationsViewState
  
  func populate() async {
    do {
      try await viewState.populateNotifications()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populateMore(id: GitHubData.Notification.ID) async {
    do {
      try await viewState.populateMoreNotifications(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(viewState.notifications) { notification in
        VStack(alignment: .leading, spacing: 0) {
          NotificationCell(notification: notification)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Divider()
        }
        .listRow()
        .task {
          await populateMore(id: notification.id)
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

#Preview {
  Text("Hello")
    .rotation3DEffect(
      .degrees(180),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
}
