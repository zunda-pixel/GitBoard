//
//  NavigationRouter.swift
//

import GitHubAPI
import Observation
import SwiftUI

@Observable
final class NavigationRouter {
  var items: [Item] = []
}

extension NavigationRouter {
  enum Item: Hashable {
    // Search
    case searchUsers(query: String)
    case searchRepositories(query: String)
    
    // Users
    case userDetail(user: User)
    
    // Repositories
    case userRepositories(ownerID: String)
    case repositoryDetail(repository: Repository)
    
    // Issues
    case issue(ownerID: String, repository: Repository)
    case issueDetail(issue: Issue, repository: Repository)
    case issueDetailOnline(ownerID: String, repositoryName: String, issueNumber: Int)
        
    // Release
    case releases(repository: Repository)
    case releaseDetail(repository: Repository, release: Release)
    case releaseDetailOnline(repository: Repository, releaseID: Int)
    
    // Follow
    case following(userID: String)
    case followers(userID: String)
    
    // Pull
    case repositoryPulls(ownerID: String, repositoryName: String)
    case pullDetail(pull: Pull)
    case pullDetailOnline(ownerID: String, repositoryName: String, pullNumber: Int)
    
    // Discussion
    case discussions(repository: Repository)
    case discussionDetail(repository: Repository, discussion: Discussion)
    case discussionDetailOnline(repository: Repository, discussionNumber: Int)
    
    case license(ownerID: String, repositoryName: String)
    case contributors(ownerID: String, repositoryName: String)
    case stargazers(ownerID: String, repositoryName: String)
    case forks(ownerID: String, repositoryName: String)
  }
}
