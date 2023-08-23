//
//  FollowersViewState.swift
//

import Foundation
import GitHubAPI
import SwiftUI

@Observable
final class FollowersViewState: UsersViewState {
  let userID: String
  var users: [User] = []
  var page: Int = 1

  init(userID: String) {
    self.userID = userID
  }

  func populateUsers() async throws {
    page = 1

    let newUsers = try await GitHubAPI().followers(
      userID: userID,
      perPage: 30,
      page: page
    )

    users.append(contentsOf: newUsers)
  }

  func populateMoreUsers(id: User.ID) async throws {
    guard id == users.last?.id else { return }
    page += 1

    let newUsers = try await GitHubAPI().followers(
      userID: userID,
      perPage: 30,
      page: page
    )

    users.append(contentsOf: newUsers)
  }
}

#Preview{
  NavigationStack {
    let viewState = FollowersViewState(userID: "zunda-pixel")
    UsersView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
