//
//  NavigationRouter.swift
//

import GitHubAPI
import Observation
import SwiftUI

@Observable
final class NavigationRouter {
  var items: [Item] = []

  enum Item: Hashable {
    case searchUsers(query: String)
    case searchRepositories(query: String)
    case userDetail(user: User)
    case userRepositories(ownerID: String)
    case repositoryDetail(repository: Repository)
    case issue(ownerID: String, repository: Repository)
    case issueDetail(issue: Issue, repository: Repository)
    case repositoryPulls(ownerID: String, repositoryName: String)
    case contributors(ownerID: String, repositoryName: String)
    case license(ownerID: String, repositoryName: String)
    case following(userID: String)
    case followers(userID: String)
    case pullDetail(pull: Pull)
    case stargazers(ownerID: String, repositoryName: String)
    case forks(ownerID: String, repositoryName: String)
  }
}

extension NavigationLink where Destination == Never {
  init(item: NavigationRouter.Item, @ViewBuilder label: () -> Label) {
    self.init(value: item, label: label)
  }
}
