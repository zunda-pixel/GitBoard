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
    case repositoryDetail(repository: Repository)
    case issue(ownerID: String, repository: Repository)
    case issueDetail(issue: Issue, repository: Repository)
    case pullRequests(ownerID: String, repositoryName: String)
    case contributors(ownerID: String, repositoryName: String)
    case license(ownerID: String, repositoryName: String)
    
  }
}

extension NavigationLink where Destination == Never {
  init(item: NavigationRouter.Item, @ViewBuilder label: () -> Label) {
    self.init(value: item, label: label)
  }
}
