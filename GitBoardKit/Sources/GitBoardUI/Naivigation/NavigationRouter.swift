//
//  NavigationRouter.swift
//

import GitHubAPI
import Observation
import SwiftUI

final class NavigationRouter: ObservableObject {
  @Published var items: [Item] = []
}

extension NavigationRouter {
  enum Item: Hashable {
    case searchUsers(query: String)
    case searchRepositories(query: String)
    case userDetail(user: User)
    case userRepositories(ownerID: String)
    case repositoryDetail(repository: Repository)
    case issue(ownerID: String, repository: Repository)
    case issueDetail(issue: Issue, repository: Repository)
    case issueDetailOnline(ownerID: String, repositoryName: String, issueNumber: Int)
    case repositoryPulls(ownerID: String, repositoryName: String)
    case contributors(ownerID: String, repositoryName: String)
    case license(ownerID: String, repositoryName: String)
    case following(userID: String)
    case followers(userID: String)
    case pullDetail(pull: Pull)
    case pullDetailOnline(ownerID: String, repositoryName: String, pullNumber: Int)
    case stargazers(ownerID: String, repositoryName: String)
    case forks(ownerID: String, repositoryName: String)
  }
}
