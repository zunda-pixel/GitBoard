//
//  ProfileNavigationView.swift
//

import GitHubAPI
import SwiftUI

struct ProfileNavigationView: View {
  @Environment(\.modelContext) var modelContext
  @State var router = NavigationRouter()
  let user: User
  let trigger: TabTrigger

  var body: some View {
    NavigationStack(path: $router.items) {
      UserDetailView(user: user)
        .navigationDestination(modelContext: modelContext)
        .navigationTitle(user.userID)
        .navigationBarTitleDisplayMode()
    }
    .environment(router)
    .onTrigger(of: trigger) {
      router.items.removeAll()
    }
  }
}

#Preview{
  ProfileNavigationView(user: .sample, trigger: .init())
}
