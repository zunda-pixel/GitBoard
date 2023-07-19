//
//  UsersViewState.swift
//

import GitHubKit
import Observation

protocol UsersViewState: Observable {
  var users: [User] { get }
  func populateUsers() async throws
  func populateMoreUsers(id: User.ID) async throws
}
