//
//  ProfileNavigationView.swift
//

import SwiftUI
import GitHubAPI

struct ProfileNavigationView: View {
  @Bindable var router = NavigationRouter()
  let user: User

  var body: some View {
    NavigationStack(path: $router.items) {
      UserDetailView(user: user)
        .navigationDestination()
        .navigationTitle(user.userID)
        .navigationBarTitleDisplayMode()
    }
    .environment(router)
  }
}

#Preview{
  ProfileNavigationView(user: .sample)
}
