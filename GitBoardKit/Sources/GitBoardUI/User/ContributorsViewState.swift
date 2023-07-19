//
//  ContributorsViewState.swift
//

import Algorithms
import GitHubKit
import SwiftUI

@Observable
final class ContributorsViewState: UsersViewState {
  let ownerID: String
  let repositoryName: String
  var page: Int = 1
  var contributors: [Contributor] = []
  var users: [User] {
    contributors
      .sorted(using: KeyPathComparator(\.contributionCount, order: .forward))
      .map(\.user)
  }

  init(
    ownerID: String,
    repositoryName: String
  ) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
  }

  func populateUsers() async throws {
    page = 1
    let newContributors = try await GitHubAPI().contributors(
      ownerID: ownerID,
      repositoryName: repositoryName,
      perPage: 30,
      page: page
    )
    contributors = newContributors
  }

  func populateMoreUsers(id: User.ID) async throws {
    guard id == users.last?.id else { return }
    page += 1

    let newContributors = try await GitHubAPI().contributors(
      ownerID: ownerID,
      repositoryName: repositoryName,
      perPage: 30,
      page: page
    )

    contributors.append(contentsOf: newContributors)
  }
}
