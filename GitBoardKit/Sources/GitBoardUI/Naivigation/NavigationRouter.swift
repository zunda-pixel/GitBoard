//
//  NavigationRouter.swift
//

import Observation
import SwiftUI

@Observable
final class NavigationRouter {
  var items: [Item] = []
  
  enum Item: Hashable {
    case searchUser
  }
}

extension NavigationLink where Destination == Never {
  init(item: NavigationRouter.Item, @ViewBuilder label: () -> Label) {
    self.init(value: item, label: label)
  }
}