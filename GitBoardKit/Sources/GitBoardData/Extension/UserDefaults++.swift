//
//  UserDefaults++.swift
//

import Foundation
import GitHubAPI

extension UserDefaults {
  public enum UserDefaultsKey: String {
    case currentUser
  }
  
  static public let shared: UserDefaults = .init(suiteName: Env.appGroup)!
}
