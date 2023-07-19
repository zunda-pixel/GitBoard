//
//  NavigationDestination.swift
//

import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case .searchUsers(query: let query):
        let viewState = SearchUsersViewState(query: query)
        UsersView(viewState: viewState)
          .navigationTitle("Search User")
          .navigationBarTitleDisplayMode()
      case .searchRepositories(query: let query):
        let viewState = SearchRepositoriesViewState(query: query)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Repositories")
          .navigationBarTitleDisplayMode()
      case .userRepositories(userID: let userID):
        let viewState = UserRepositoriesViewState(userID: userID)
        RepositoriesView(viewState: viewState)
          .navigationTitle("Repositories")
          .navigationBarTitleDisplayMode()
      case .userDetail(user: let user):
        UserDetailView(user: user)
          .navigationTitle(user.userID)
          .navigationBarTitleDisplayMode()
      case .repositoryDetail(repository: let repository):
        RepositoryDetailView(repository: repository)
          .navigationTitle(repository.name)
          .navigationBarTitleDisplayMode()
      case .issue(ownerID: let ownerID, repository: let repository):
        let viewState = RepositoryIssuesViewState(ownerID: ownerID, repository: repository)
        IssuesView(viewState: viewState)
          .navigationTitle("Issues")
          .navigationBarTitleDisplayMode()
      case .issueDetail(issue: let issue, repository: let repository):
        IssueDetailView(issue: issue, repository: repository)
          .navigationTitle("Issue #\(issue.number)")
          .navigationBarTitleDisplayMode()
      case .repositoryPulls(ownerID: let ownerID, repositoryName: let repositoryName):
        let viewState = RepositoryPullsViewState(ownerID: ownerID, repositoryName: repositoryName)
        PullsView(viewState: viewState)
          .navigationTitle("Pull Requests")
          .navigationBarTitleDisplayMode()
      case .contributors(ownerID: let ownerID, repositoryName: let repositoryName):
        ContributorsView(ownerID: ownerID, repositoryName: repositoryName)
          .navigationTitle("Contributors")
          .navigationBarTitleDisplayMode()
      case .license(ownerID: let ownerID, repositoryName: let repositoryName):
        LicenseView(ownerID: ownerID, repositoryName: repositoryName)
          .navigationTitle("License")
          .navigationBarTitleDisplayMode()
      case .followers(userID: let userID):
        let viewState = FollowersViewState(userID: userID)
        UsersView(viewState: viewState)
          .navigationTitle("Followers")
          .navigationBarTitleDisplayMode()
      case .following(userID: let userID):
        let viewState = FollowingViewState(userID: userID)
        UsersView(viewState: viewState)
          .navigationTitle("Following")
          .navigationBarTitleDisplayMode()
      case .pullDetail(pull: let pull):
        let viewState = RepositoryPullDetailViewState(pull: pull)
        PullDetailView(viewState: viewState)
          .navigationTitle("Pull #\(pull.number)")
          .navigationBarTitleDisplayMode()
      }
    }
  }
}

private extension View {
  func navigationBarTitleDisplayMode() -> some View {
    #if os(macOS)
    self
    #else
    self.navigationBarTitleDisplayMode(.inline)
    #endif
  }
}
