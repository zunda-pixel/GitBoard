//
//  ProfileNavigationView.swift
//

import SwiftUI
import GitHubAPI

struct ProfileNavigationView: View {
  @StateObject var router = NavigationRouter()
  let user: User
  let trigger: TabTrigger

  var body: some View {
    NavigationStack(path: $router.items) {
      UserDetailView(user: user)
        .navigationDestination()
        .navigationTitle(user.userID)
        .navigationBarTitleDisplayMode()
    }
    .environmentObject(router)
    .onTrigger(of: trigger) {
      router.items.removeAll()
    }
  }
}

#Preview{
  ProfileNavigationView(user: .sample, trigger: .init())
}
