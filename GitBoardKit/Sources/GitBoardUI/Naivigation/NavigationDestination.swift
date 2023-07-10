//
//  NavigationDestination.swift
//

import SwiftUI

extension View {
  func navigationDestination() -> some View {
    self.navigationDestination(for: NavigationRouter.Item.self) { item in
      switch item {
      case .searchUsers:
        SearchUsersView()
          .navigationTitle("Search User")
          .navigationBarTitleDisplayMode()
      case .searchRepositories:
        SearchRepositoriesView()
          .navigationTitle("Search Repository")
          .navigationBarTitleDisplayMode()
      case .repositories(userID: let userID):
        RepositoriesView(userID: userID)
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
      case .issue(ownerID: let ownerID, repositoryName: let repositoryName):
        IssuesView(ownerID: ownerID, repositoryName: repositoryName)
          .navigationTitle("Issues")
          .navigationBarTitleDisplayMode()
      case .pullRequests(ownerID: let ownerID, repositoryName: let repositoryName):
        PullRequestsView(ownerID: ownerID, repositoryName: repositoryName)
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
