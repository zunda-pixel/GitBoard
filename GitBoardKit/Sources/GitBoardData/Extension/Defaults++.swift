//
//  UserDefaults++.swift
//

import Foundation
import GitHubData
import Defaults

extension UserDefaults {  
  static public let shared: UserDefaults = .init(suiteName: Env.appGroup)!
}

extension Defaults.Keys {
  static public let currentUser = Key<GitHubData.User?>("currentUser", suite: .shared)
}

extension GitHubData.User: _DefaultsSerializable { }
