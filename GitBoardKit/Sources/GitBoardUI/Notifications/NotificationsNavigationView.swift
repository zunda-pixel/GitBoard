//
//  NotificationsNavigationView.swift
//

import SwiftUI
import SwiftData

struct NotificationsNavigationView: View {
  @Environment(\.modelContext) var modelContext
  let trigger: TabTrigger
  @State var router = NavigationRouter()

  var body: some View {
    NavigationStack(path: $router.items) {
      let viewState = NotificationsViewState()
      NotificationsView(viewState: viewState)
        .navigationDestination(modelContext: modelContext)
        .navigationTitle("Notifications")
    }
    .environment(router)
    .onTrigger(of: trigger) {
      router.items.removeAll()
    }
  }
}

#Preview{
  NotificationsNavigationView(trigger: .init())
}
