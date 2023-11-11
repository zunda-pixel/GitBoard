//
//  NavigationRouter.swift
//

import GitBoardData
import GitHubData
import Observation
import SwiftUI

@Observable
final class NavigationRouter {
  @MainActor
  var items: [Item] = []
}

extension NavigationRouter {
  enum Item: Hashable {
    // Search
    case searchUsers(query: String)
    case searchRepositories(query: String)

    // Users
    case userDetail(user: GitHubData.User)

    // Repositories
    case userRepositories(ownerID: String)
    case repositoryDetail(repository: GitHubData.Repository)

    // Issues
    case issue(ownerID: String, repository: GitHubData.Repository)
    case issueDetail(issue: GitHubData.Issue, repository: GitHubData.Repository)
    case issueDetailOnline(ownerID: String, repositoryName: String, issue: Issue)
    case issueDetailOnlineWithoutIssue(ownerID: String, repositoryName: String, issueNumber: Int)

    // Release
    case releases(repository: GitHubData.Repository)
    case releaseDetail(repository: GitHubData.Repository, release: GitHubData.Release)
    case releaseDetailOnline(repository: GitHubData.Repository, releaseID: Release.ID)
    case releaseDetailOnlineWithoutRepository(ownerID: String, repositoryName: String, release: GitHubData.Release)
    case releaseDetailOnlineWithoutRepoisitoryAndRelease(ownerID: String, repositoryName: String, releaseID: Release.ID)

    // Follow
    case following(userID: String)
    case followers(userID: String)

    // Pull
    case repositoryPulls(ownerID: String, repositoryName: String)
    case pullDetail(pull: Pull, commentID: Pull.Comment.ID?)
    case pullDetailOnline(ownerID: String, repositoryName: String, pullNumber: Int)

    // Discussion
    case discussions(repository: GitHubData.Repository)
    case discussionDetail(repository: GitHubData.Repository, discussion: GitBoardData.Discussion)
    case discussionDetailOnline(repository: GitHubData.Repository, discussionNumber: Int)

    case license(ownerID: String, repositoryName: String)
    case contributors(ownerID: String, repositoryName: String)
    case stargazers(ownerID: String, repositoryName: String)
    case forks(ownerID: String, repositoryName: String)
  }
}
