//
//  StargazersViewState.swift
//

import Foundation
import GitHubAPI
import Observation

@Observable
final class StargazersViewState: UsersViewState {
  let ownerID: String
  let repositoryName: String
  var users: [GitHubData.User] = []
  var page: Int = 1

  init(
    ownerID: String,
    repositoryName: String
  ) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
  }

  func populateUsers() async throws {
    page = 1

    let newUsers = try await GitHubAPI().stargazers(
      ownerID: ownerID,
      repositoryName: repositoryName,
      perPage: 30,
      page: page
    )

    self.users = newUsers
  }

  func populateMoreUsers(id: GitHubData.User.ID) async throws {
    guard id == self.users.last?.id else { return }
    page += 1

    let newUsers = try await GitHubAPI().stargazers(
      ownerID: ownerID,
      repositoryName: repositoryName,
      perPage: 30,
      page: page
    )

    self.users.append(contentsOf: newUsers)
  }
}
