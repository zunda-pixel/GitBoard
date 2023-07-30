//
//  ProfileNavigationView.swift
//

import SwiftUI
import GitHubAPI

struct ProfileNavigationView: View {
  @Bindable var router = NavigationRouter()
  let user: User
  let tabTapAgain: UUID

  var body: some View {
    NavigationStack(path: $router.items) {
      UserDetailView(user: user)
        .navigationDestination()
        .navigationTitle(user.userID)
        .navigationBarTitleDisplayMode()
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
  ProfileNavigationView(user: .sample, tabTapAgain: .init())
}
