//
//  UserDefaults++.swift
//

import Defaults
import Foundation
import GitHubData

extension UserDefaults {
  static public let shared: UserDefaults = .init(suiteName: "\(Env.appGroupPrefix).\(Env.appGroup)")!
}

extension Defaults.Keys {
  static public let currentUser = Key<GitHubData.User?>("currentUser", suite: .shared)
}

extension GitHubData.User: _DefaultsSerializable {}
