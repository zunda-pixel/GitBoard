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
          .navigationBarTitleDisplayMode(.inline)
      case .searchRepositories:
        SearchRepositoriesView()
          .navigationTitle("Search Repository")
          .navigationBarTitleDisplayMode(.inline)
      }
    }
  }
}
