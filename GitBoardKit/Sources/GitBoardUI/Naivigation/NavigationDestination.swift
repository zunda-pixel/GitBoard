//
//  navigationDestination.swift
//

import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case .searchUser:
        SearchUserView()
      }
    }
  }
}
