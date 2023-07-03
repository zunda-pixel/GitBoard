//
//  FollowersViewState.swift
//

import Foundation
import OctoKit
import Observation

protocol FollowersViewState: Observable {
  var userName: String { get }
  var followers: [User] { get }
  
  func fetchFollowers() async
}
