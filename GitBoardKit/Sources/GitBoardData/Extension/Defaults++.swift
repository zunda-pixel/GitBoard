//
//  UserDefaults++.swift
//

import Foundation
import GitHubAPI
import Defaults

extension UserDefaults {  
  static public let shared: UserDefaults = .init(suiteName: Env.appGroup)!
}

extension Defaults.Keys {
  static public let currentUser = Key<User?>("currentUser", suite: .shared)
}

extension User: _DefaultsSerializable { }
