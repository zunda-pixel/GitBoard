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
