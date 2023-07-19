//
//  NotificationsView.swift
//

import SwiftUI
import GitHubAPI

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
  NavigationStack {
    let viewState = NotificationsViewState()
    NotificationsView(viewState: viewState)
  }
  .environment(ErrorHandle())
}
