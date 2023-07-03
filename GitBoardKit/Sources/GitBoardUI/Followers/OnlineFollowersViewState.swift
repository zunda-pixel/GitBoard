//
//  OnlineFollowersViewState.swift
//

import Foundation
import OctoKit
import Observation

@Observable
final class OnlineFollowersViewState: FollowersViewState {
  let userName: String
  var followers: [User] = []

  init(userName: String) {
    self.userName = userName
  }
  
  func fetchFollowers() async {
    do {
      followers = try await Octokit().following(name: userName)
    } catch {
      print(error)
    }
  }
}
