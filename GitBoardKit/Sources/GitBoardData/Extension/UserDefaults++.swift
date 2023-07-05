//
//  UserDefaults++.swift
//

import Foundation

extension UserDefaults {
  static public let shared: UserDefaults = .init(suiteName: Env.appGroup)!
  
  public enum UserDefaultsKey: String {
    case currentUserID
    case loginUserIDs
  }
  
  var currentUserID: Int? {
    get {
      self.string(key: .currentUserID).map { Int($0)! }
    }
  }
  
  var loginUserIDs: [String] {
    get {
      self.stringArray(key: .loginUserIDs) ?? []
    }
    set {
      self.setValue(newValue, key: .loginUserIDs)
    }
  }
  
  private func string(key: UserDefaultsKey) -> String? {
    self.string(forKey: key.rawValue)
  }
  
  private func stringArray(key: UserDefaultsKey) -> [String]? {
    self.stringArray(forKey: key.rawValue)
  }
  
  private func setValue(_ value: Any?, key: UserDefaultsKey) {
    self.setValue(value, forKey: key.rawValue)
  }
}
