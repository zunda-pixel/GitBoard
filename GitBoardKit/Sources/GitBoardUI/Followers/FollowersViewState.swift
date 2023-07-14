//
//  FollowersViewState.swift
//

import Foundation
import SwiftUI
import GitHubKit

@Observable
final class FollowersViewState: UsersViewState {
  let userName: String
  var users: [User] = []

  init(userName: String) {
    self.userName = userName
  }
  
  func populateUsers() async throws {
  }
  
  func populateMoreUsers(id: User.ID) async throws {
  }
}

#Preview {
  NavigationStack {
    let viewState = FollowersViewState(userName: "apple")
    UsersView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
