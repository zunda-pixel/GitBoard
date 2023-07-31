//
//  NotificationsNavigationView.swift
//

import SwiftUI

struct NotificationsNavigationView: View {
  let trigger: TabTrigger
  @StateObject var router = NavigationRouter()

  var body: some View {
    NavigationStack(path: $router.items) {
      let viewState = NotificationsViewState()
      NotificationsView(viewState: viewState)
        .navigationDestination()
        .navigationTitle("Notifications")
    }
    .environmentObject(router)
    .onTrigger(of: trigger) {
      router.items.removeAll()
    }
  }
}

#Preview{
  NotificationsNavigationView(trigger: .init())
}
