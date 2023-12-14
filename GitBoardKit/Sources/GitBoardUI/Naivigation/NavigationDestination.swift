//
//  NavigationDestination.swift
//

import SwiftData
import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case let .searchUsers(query):
        SearchUsersView(query: query)
          .navigationTitle("Search User")
          .navigationBarTitleDisplayMode()
      case let .searchRepositories(query):
        let viewState = SearchRepositoriesViewState(query: query)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Repositories")
          .navigationBarTitleDisplayMode()
      case let .userRepositories(ownerID):
        let viewState = UserRepositoriesViewState(ownerID: ownerID)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Repositories")
          .navigationBarTitleDisplayMode()
      case let .userDetail(user):
        UserDetailView(user: user)
          .navigationTitle(user.userID)
          .navigationBarTitleDisplayMode()
      case let .repositoryDetail(repository):
        RepositoryDetailView(repository: repository)
          .navigationTitle(repository.name)
          .navigationBarTitleDisplayMode()
      case let .issue(ownerID, repository):
        let viewState = RepositoryIssuesViewState(ownerID: ownerID, repository: repository)
        IssuesView(viewState: viewState)
          .navigationTitle("Issues")
          .navigationBarTitleDisplayMode()
      case let .issueDetail(issue, repository):
        let viewState = RepositoryIssueDetailViewState(issue: issue, repository: repository)
        IssueDetailView(viewState: viewState)
          .navigationTitle("Issue #\(issue.number)")
          .navigationBarTitleDisplayMode()
      case let .issueDetailOnline(ownerID, repositoryName, issue):
        let viewState = RepositoryIssueDetailOnlineViewState(ownerID: ownerID, repositoryName: repositoryName, issue: issue)
        IssueDetailOnlineView(viewState: viewState)
        .navigationTitle("Issue #\(issue.number)")
        .navigationBarTitleDisplayMode()
      case let .issueDetailOnlineWithoutIssue(ownerID, repositoryName, issueNumber):
        let viewState = RepositoryIssueDetailOnlineViewState(ownerID: ownerID, repositoryName: repositoryName, issueNumber: issueNumber)
        IssueDetailOnlineView(viewState: viewState)
        .navigationTitle("Issue #\(issueNumber)")
        .navigationBarTitleDisplayMode()
      case let .repositoryPullRequests(ownerID, repositoryName):
        let viewState = RepositoryPullRequestsViewState(ownerID: ownerID, repositoryName: repositoryName)
        PullRequestsView(viewState: viewState)
          .navigationTitle("Pull Requests")
          .navigationBarTitleDisplayMode()
      case let .contributors(ownerID, repositoryName):
        let viewState = ContributorsViewState(ownerID: ownerID, repositoryName: repositoryName)
        UsersView(viewState: viewState)
          .navigationTitle("Contributors")
          .navigationBarTitleDisplayMode()
      case let .releases(repository):
        let viewState = ReleasesViewState(repository: repository)
        ReleasesView(viewState: viewState)
          .navigationTitle("Releases")
          .navigationBarTitleDisplayMode()
      case let .releaseDetail(repository, release):
        ReleaseDetailView(repository: repository, release: release)
          .navigationTitle("Release #\(release.id.rawValue)")
          .navigationBarTitleDisplayMode()
      case let .releaseDetailOnline(repository, releaseID):
        let viewState = RepositoryReleaseDetailOnlineViewState(
          repository: repository,
          releaseID: releaseID
        )
        ReleaseDetailOnlineView(viewState: viewState)
          .navigationTitle("Release #\(releaseID.rawValue)")
          .navigationBarTitleDisplayMode()
      case let .releaseDetailOnlineWithoutRepoisitoryAndRelease(ownerID, repositoryName, releaseID):
        let viewState = RepositoryReleaseDetailOnlineViewState(
          ownerID: ownerID,
          repositoryName: repositoryName,
          releaseID: releaseID
        )
        ReleaseDetailOnlineView(viewState: viewState)
          .navigationTitle("Release #\(releaseID.rawValue)")
          .navigationBarTitleDisplayMode()
      case let .releaseDetailOnlineWithoutRepository(ownerID, repositoryName, release):
        let viewState = RepositoryReleaseDetailOnlineViewState(
          ownerID: ownerID,
          repositoryName: repositoryName,
          release: release
        )
        ReleaseDetailOnlineView(viewState: viewState)
          .navigationTitle("Release #\(release.id.rawValue)")
          .navigationBarTitleDisplayMode()
      case let .license(ownerID, repositoryName):
        let viewState = LicenseViewState(ownerID: ownerID, repositoryName: repositoryName)
        LicenseView(viewState: viewState)
          .navigationTitle("License")
          .navigationBarTitleDisplayMode()
      case let .followers(userID):
        let viewState = FollowersViewState(userID: userID)
        UsersView(viewState: viewState)
          .navigationTitle("Followers")
          .navigationBarTitleDisplayMode()
      case let .following(userID):
        let viewState = FollowingViewState(userID: userID)
        UsersView(viewState: viewState)
          .navigationTitle("Following")
          .navigationBarTitleDisplayMode()
      case let .pullRequestDetail(pullRequest, commentID):
        let viewState = RepositoryPullRequestDetailViewState(pullRequest: pullRequest, commentID: commentID)
        PullRequestDetailView(viewState: viewState)
          .navigationTitle("Pull #\(pullRequest.number)")
          .navigationBarTitleDisplayMode()
      case let .pullRequestDetailOnline(ownerID, repositoryName, pullNumber):
        PullRequestDetailOnlineView(
          ownerID: ownerID,
          repositoryName: repositoryName,
          pullNumber: pullNumber
        )
        .navigationTitle("Pull #\(pullNumber)")
        .navigationBarTitleDisplayMode()
      case let .stargazers(ownerID, repositoryName):
        let viewState = StargazersViewState(ownerID: ownerID, repositoryName: repositoryName)
        UsersView(viewState: viewState)
          .navigationTitle("Stargazers")
          .navigationBarTitleDisplayMode()
      case let .forks(ownerID, repositoryName):
        let viewState = ForksRepositoriesViewState(ownerID: ownerID, repositoryName: repositoryName)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Forks")
          .navigationBarTitleDisplayMode()
      case let .discussions(repository):
        DiscussionsView(repository: repository)
          .navigationTitle("Discussions")
          .navigationBarTitleDisplayMode()
      case let .discussionDetail(repository, discussion):
        let viewState = RepositoryDiscussionDetailViewState(
          repository: repository,
          discussion: discussion
        )
        DiscussionDetailView(viewState: viewState)
          .navigationTitle("Discussion \(discussion.title)")
          .navigationBarTitleDisplayMode()
      case let .discussionDetailOnline(repository, discussionNumber):
        DiscussionDetailOnlineView(repository: repository, discussionNumber: discussionNumber)
          .navigationTitle("Discussion")
          .navigationBarTitleDisplayMode()
      }
    }
  }
}

extension View {
  func navigationBarTitleDisplayMode() -> some View {
    #if os(macOS)
      self
    #else
      self.navigationBarTitleDisplayMode(.inline)
    #endif
  }
}
