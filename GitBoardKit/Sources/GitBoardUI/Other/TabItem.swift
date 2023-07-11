//
//  TabItem.swift
//

import Foundation

enum TabItem: String, CaseIterable, Identifiable {
  case search
  
  var id: Self { self }
  
  var label: (text: String, systemImage: String) {
    switch self {
    case .search:
      return ("Search", "magnifyingglass")
    }
  }
}
