//
//  NavigationDestination.swift
//

import SwiftData
import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case .searchUsers(let query):
        SearchUsersView(query: query)
          .navigationTitle("Search User")
          .navigationBarTitleDisplayMode()
      case .searchRepositories(let query):
        let viewState = SearchRepositoriesViewState(query: query)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Repositories")
          .navigationBarTitleDisplayMode()
      case .userRepositories(let ownerID):
        let viewState = UserRepositoriesViewState(ownerID: ownerID)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Repositories")
          .navigationBarTitleDisplayMode()
      case .userDetail(let user):
        UserDetailView(user: user)
          .navigationTitle(user.userID)
          .navigationBarTitleDisplayMode()
      case .repositoryDetail(let repository):
        RepositoryDetailView(repository: repository)
          .navigationTitle(repository.name)
          .navigationBarTitleDisplayMode()
      case .issue(let ownerID, let repository):
        let viewState = RepositoryIssuesViewState(ownerID: ownerID, repository: repository)
        IssuesView(viewState: viewState)
          .navigationTitle("Issues")
          .navigationBarTitleDisplayMode()
      case .issueDetail(let issue, let repository):
        let viewState = RepositoryIssueDetailViewState(issue: issue, repository: repository)
        IssueDetailView(viewState: viewState)
          .navigationTitle("Issue #\(issue.number)")
          .navigationBarTitleDisplayMode()
      case .issueDetailOnline(let ownerID, let repositoryName, let issue):
        let viewState = RepositoryIssueDetailOnlineViewState(ownerID: ownerID, repositoryName: repositoryName, issue: issue)
        IssueDetailOnlineView(viewState: viewState)
        .navigationTitle("Issue #\(issue.number)")
        .navigationBarTitleDisplayMode()
      case .issueDetailOnlineWithoutIssue(let ownerID, let repositoryName, let issueNumber):
        let viewState = RepositoryIssueDetailOnlineViewState(ownerID: ownerID, repositoryName: repositoryName, issueNumber: issueNumber)
        IssueDetailOnlineView(viewState: viewState)
        .navigationTitle("Issue #\(issueNumber)")
        .navigationBarTitleDisplayMode()
      case .repositoryPullRequests(let ownerID, let repositoryName):
        let viewState = RepositoryPullRequestsViewState(ownerID: ownerID, repositoryName: repositoryName)
        PullRequestsView(viewState: viewState)
          .navigationTitle("Pull Requests")
          .navigationBarTitleDisplayMode()
      case .contributors(let ownerID, let repositoryName):
        let viewState = ContributorsViewState(ownerID: ownerID, repositoryName: repositoryName)
        UsersView(viewState: viewState)
          .navigationTitle("Contributors")
          .navigationBarTitleDisplayMode()
      case .releases(let repository):
        let viewState = ReleasesViewState(repository: repository)
        ReleasesView(viewState: viewState)
          .navigationTitle("Releases")
          .navigationBarTitleDisplayMode()
      case .releaseDetail(let repository, let release):
        ReleaseDetailView(repository: repository, release: release)
          .navigationTitle("Release #\(release.id.rawValue)")
          .navigationBarTitleDisplayMode()
      case .releaseDetailOnline(let repository, let releaseID):
        let viewState = RepositoryReleaseDetailOnlineViewState(
          repository: repository,
          releaseID: releaseID
        )
        ReleaseDetailOnlineView(viewState: viewState)
          .navigationTitle("Release #\(releaseID.rawValue)")
          .navigationBarTitleDisplayMode()
      case .releaseDetailOnlineWithoutRepoisitoryAndRelease(let ownerID, let repositoryName, let releaseID):
        let viewState = RepositoryReleaseDetailOnlineViewState(
          ownerID: ownerID,
          repositoryName: repositoryName,
          releaseID: releaseID
        )
        ReleaseDetailOnlineView(viewState: viewState)
          .navigationTitle("Release #\(releaseID.rawValue)")
          .navigationBarTitleDisplayMode()
      case .releaseDetailOnlineWithoutRepository(let ownerID, let repositoryName, let release):
        let viewState = RepositoryReleaseDetailOnlineViewState(
          ownerID: ownerID,
          repositoryName: repositoryName,
          release: release
        )
        ReleaseDetailOnlineView(viewState: viewState)
          .navigationTitle("Release #\(release.id.rawValue)")
          .navigationBarTitleDisplayMode()
      case .license(let ownerID, let repositoryName):
        let viewState = LicenseViewState(ownerID: ownerID, repositoryName: repositoryName)
        LicenseView(viewState: viewState)
          .navigationTitle("License")
          .navigationBarTitleDisplayMode()
      case .followers(let userID):
        let viewState = FollowersViewState(userID: userID)
        UsersView(viewState: viewState)
          .navigationTitle("Followers")
          .navigationBarTitleDisplayMode()
      case .following(let userID):
        let viewState = FollowingViewState(userID: userID)
        UsersView(viewState: viewState)
          .navigationTitle("Following")
          .navigationBarTitleDisplayMode()
      case .pullRequestDetail(let pullRequest, let commentID):
        let viewState = RepositoryPullRequestDetailViewState(pullRequest: pullRequest, commentID: commentID)
        PullRequestDetailView(viewState: viewState)
          .navigationTitle("Pull #\(pullRequest.number)")
          .navigationBarTitleDisplayMode()
      case .pullRequestDetailOnline(let ownerID, let repositoryName, let pullNumber):
        PullRequestDetailOnlineView(
          ownerID: ownerID,
          repositoryName: repositoryName,
          pullNumber: pullNumber
        )
        .navigationTitle("Pull #\(pullNumber)")
        .navigationBarTitleDisplayMode()
      case .stargazers(let ownerID, let repositoryName):
        let viewState = StargazersViewState(ownerID: ownerID, repositoryName: repositoryName)
        UsersView(viewState: viewState)
          .navigationTitle("Stargazers")
          .navigationBarTitleDisplayMode()
      case .forks(let ownerID, let repositoryName):
        let viewState = ForksRepositoriesViewState(ownerID: ownerID, repositoryName: repositoryName)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Forks")
          .navigationBarTitleDisplayMode()
      case .discussions(let repository):
        DiscussionsView(repository: repository)
          .navigationTitle("Discussions")
          .navigationBarTitleDisplayMode()
      case .discussionDetail(let repository, let discussion):
        let viewState = RepositoryDiscussionDetailViewState(
          repository: repository,
          discussion: discussion
        )
        DiscussionDetailView(viewState: viewState)
          .navigationTitle("Discussion \(discussion.title)")
          .navigationBarTitleDisplayMode()
      case .discussionDetailOnline(let repository, let discussionNumber):
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
