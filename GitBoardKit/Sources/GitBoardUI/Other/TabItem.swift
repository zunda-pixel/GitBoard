//
//  TabItem.swift
//

import Foundation

enum TabItem: String, CaseIterable, Identifiable {
  case search
  case notifications
  
  var id: Self { self }

  var label: (text: String, systemImage: String) {
    switch self {
    case .search:
      return ("Search", "magnifyingglass")
    case .notifications:
      return ("Notifications", "bell")
    }
  }
}
