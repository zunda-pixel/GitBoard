//
//  OnlineFollowersViewState.swift
//

import Foundation
import Observation
import GitHubKit

@Observable
final class OnlineFollowersViewState: FollowersViewState {
  let userName: String
  var followers: [User] = []

  init(userName: String) {
    self.userName = userName
  }
  
  func fetchFollowers() async {
  }
}
