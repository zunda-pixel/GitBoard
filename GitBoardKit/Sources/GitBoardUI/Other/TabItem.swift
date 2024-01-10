//
//  TabItem.swift
//

import SwiftUI

enum TabItem: String, CaseIterable, Identifiable {
  case home
  case notifications
  case profile

  var id: Self { self }

  var label: (text: LocalizedStringKey, systemImage: String) {
    switch self {
    case .home:
      return ("HomeTab", "house")
    case .notifications:
      return ("NotificationsTab", "bell")
    case .profile:
      return ("ProfileTab", "person")
    }
  }
}
