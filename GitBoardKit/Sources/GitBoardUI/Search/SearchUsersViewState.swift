//
//  SearchUsersViewState.swift
//

import SwiftUI
import GitHubKit
import Algorithms

@Observable
final class SearchUsersViewState: UsersViewState {
  let query: String
  var users: [User] = []
  var page: Int = 1
  
  init(query: String) {
    self.query = query
  }
  
  func populateUsers() async throws {
    page = 1
    
    let response = try await GitHubAPI().searchUsers(
      query: query,
      sort: nil,
      order: .desc,
      perPage: 30,
      page: page
    )
    users = response.users
  }
  
  func populateMoreUsers(id: User.ID) async throws {
    guard id == users.last?.id else { return }
    
    page += 1
    
    let response = try await GitHubAPI().searchUsers(
      query: query,
      sort: nil,
      order: .desc,
      perPage: 30,
      page: page
    )
    
    users.append(contentsOf: response.users)
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
