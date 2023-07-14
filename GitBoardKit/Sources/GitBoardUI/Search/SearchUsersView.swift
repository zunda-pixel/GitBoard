//
//  SearchUsersView.swift
//

import SwiftUI
import GitHubKit
import Algorithms

@Observable
final class SearchUsersViewState: UsersViewState {
  let query: String
  var users: [User] = []
  
  init(query: String) {
    self.query = query
  }
  
  func populateUsers() async throws {
    let response = try await GitHubAPI().searchUsers(query: query)
    users = response.users
  }
  
  func populateMoreUsers(id: User.ID) async throws {
    let response = try await GitHubAPI().searchUsers(query: query)
    users = response.users
  }
}

#Preview {
  NavigationStack {
    let viewState = SearchUsersViewState(query: "apple")
    UsersView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
