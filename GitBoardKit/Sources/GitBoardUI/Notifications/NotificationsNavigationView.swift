//
//  NotificationsNavigationView.swift
//

import SwiftUI

struct NotificationsNavigationView: View {
  @Bindable var router = NavigationRouter()

  var body: some View {
    NavigationStack(path: $router.items) {
      let viewState = NotificationsViewState()
      NotificationsView(viewState: viewState)
        .navigationDestination()
        .navigationTitle("Notifications")
    }
    .environment(router)
  }
}

#Preview{
  NotificationsNavigationView()
}
