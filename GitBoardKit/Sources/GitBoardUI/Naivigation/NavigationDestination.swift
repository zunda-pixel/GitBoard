//
//  NavigationDestination.swift
//

import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case .searchUsers:
        SearchUsersView()
          .navigationTitle("Search User")
          .navigationBarTitleDisplayMode()
      case .searchRepositories:
        SearchRepositoriesView()
          .navigationTitle("Search Repository")
          .navigationBarTitleDisplayMode()
      case .repositories(userID: let userID):
        RepositoriesView(userID: userID)
      case .userDetail(user: let user):
        UserDetailView(user: user)
      }
    }
  }
}

private extension View {
  func navigationBarTitleDisplayMode() -> some View {
    #if os(macOS)
    self
    #else
    self.navigationBarTitleDisplayMode(.inline)
    #endif
  }
}
