//
//  TabItem.swift
//

import Foundation

enum TabItem: String, CaseIterable, Identifiable {
  case home
  case notifications
  case profile

  var id: Self { self }

  var label: (text: String, systemImage: String) {
    switch self {
    case .home:
      return ("Home", "house")
    case .notifications:
      return ("Notifications", "bell")
    case .profile:
      return ("Profile", "person")
    }
  }
}
