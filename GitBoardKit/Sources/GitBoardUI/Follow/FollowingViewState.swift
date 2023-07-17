//
//  FollowingViewState.swift
//

import Foundation
import SwiftUI
import GitHubKit

@Observable
final class FollowingViewState: UsersViewState {
  let userID: String
  var users: [User] = []
  var page: Int = 1

  init(userID: String) {
    self.userID = userID
  }
  
  func populateUsers() async throws {
    page = 1
    
    let newUsers = try await GitHubAPI().following(
      userID: userID,
      perPage: 30,
      page: page
    )
    
    users.append(contentsOf: newUsers)
  }
  
  func populateMoreUsers(id: User.ID) async throws {
    guard id == users.last?.id else { return }
    page += 1
    
    let newUsers = try await GitHubAPI().following(
      userID: userID,
      perPage: 30,
      page: page
    )
    
    users.append(contentsOf: newUsers)
  }
}

#Preview {
  NavigationStack {
    let viewState = FollowingViewState(userID: "zunda-pixel")
    UsersView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
