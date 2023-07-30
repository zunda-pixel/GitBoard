//
//  NotificationsNavigationView.swift
//

import SwiftUI

struct NotificationsNavigationView: View {
  let tabTapAgain: UUID
  @Bindable var router = NavigationRouter()

  var body: some View {
    NavigationStack(path: $router.items) {
      let viewState = NotificationsViewState()
      NotificationsView(viewState: viewState)
        .navigationDestination()
        .navigationTitle("Notifications")
    }
    .environment(router)
    .onChange(of: tabTapAgain) { oldValue, newValue in
      if newValue != oldValue {
        router.items.removeAll()
      }
    }
  }
}

#Preview{
  NotificationsNavigationView(tabTapAgain: .init())
}
