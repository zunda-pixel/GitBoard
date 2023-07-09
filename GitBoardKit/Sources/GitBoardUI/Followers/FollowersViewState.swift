//
//  FollowersViewState.swift
//

import Foundation
import Observation
import GitHubKit

protocol FollowersViewState: Observable {
  var userName: String { get }
  var followers: [User] { get }
  
  func fetchFollowers() async
}
