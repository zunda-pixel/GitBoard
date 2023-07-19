//
//  AppStorage++.swift
//

import SwiftUI
import GitHubData

extension AppStorage {
  init<R>(
    key: UserDefaults.UserDefaultsKey,
    store: UserDefaults? = nil
  ) where Value == R?, R : RawRepresentable, R.RawValue == String {
    self.init(key.rawValue, store: store)
  }
}
