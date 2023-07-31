//
//  NavigationDestination.swift
//

import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case .searchUsers(let query):
        let viewState = SearchUsersViewState(query: query)
        UsersView(viewState: viewState)
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
        IssueDetailView(issue: issue, repository: repository)
          .navigationTitle("Issue #\(issue.number)")
          .navigationBarTitleDisplayMode()
      case .issueDetailOnline(let ownerID, let repositoryName, let issueNumber):
        IssueDetailOnlineView(
          ownerID: ownerID,
          repositoryName: repositoryName,
          issueNumber: issueNumber
        )
          .navigationTitle("Issue #\(issueNumber)")
          .navigationBarTitleDisplayMode()
      case .repositoryPulls(let ownerID, let repositoryName):
        let viewState = RepositoryPullsViewState(ownerID: ownerID, repositoryName: repositoryName)
        PullsView(viewState: viewState)
          .navigationTitle("Pull Requests")
          .navigationBarTitleDisplayMode()
      case .contributors(let ownerID, let repositoryName):
        let viewState = ContributorsViewState(ownerID: ownerID, repositoryName: repositoryName)
        UsersView(viewState: viewState)
          .navigationTitle("Contributors")
          .navigationBarTitleDisplayMode()
      case .releases(let ownerID, let repositoryName):
        let viewState = ReleasesViewState(ownerID: ownerID, repositoryName: repositoryName)
        ReleasesView(viewState: viewState)
          .navigationTitle("Releases")
          .navigationBarTitleDisplayMode()
      case .releaseDetailOnline(let ownerID, let repositoryName, let releaseID):
        ReleaseDetailOnlineView(ownerID: ownerID, repositoryName: repositoryName, releaseID: releaseID)
          .navigationTitle("Release #\(releaseID)")
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
      case .pullDetail(let pull):
        let viewState = RepositoryPullDetailViewState(pull: pull)
        PullDetailView(viewState: viewState)
          .navigationTitle("Pull #\(pull.number)")
          .navigationBarTitleDisplayMode()
      case .pullDetailOnline(let ownerID, let repositoryName, let pullNumber):
        PullDetailOnlineView(
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
