//
//  NotificationsNavigationView.swift
//

import SwiftData
import SwiftUI

struct NotificationsNavigationView: View {
  let trigger: TabTrigger
  @State var router = NavigationRouter()

  var body: some View {
    NavigationStack(path: $router.items) {
      NotificationsView()
        .navigationDestination()
        .navigationTitle(Text("NotificationsTab", bundle: .module))
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
