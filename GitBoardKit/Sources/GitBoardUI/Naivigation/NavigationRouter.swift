//
//  NavigationRouter.swift
//

import Observation
import SwiftUI
import GitHubKit

@Observable
final class NavigationRouter {
  var items: [Item] = []
  
  enum Item: Hashable {
    case searchUsers
    case searchRepositories
    case userDetail(user: User)
    case repositories(userID: String)
  }
}

extension NavigationLink where Destination == Never {
  init(item: NavigationRouter.Item, @ViewBuilder label: () -> Label) {
    self.init(value: item, label: label)
  }
}
