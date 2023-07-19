//
//  KeychainSwift.swift
//

import Foundation
import GitHubAPI
import KeychainSwift

extension KeychainSwift {
  public static var shared: KeychainSwift {
    let keychain = KeychainSwift()
    keychain.accessGroup = "\(Env.teamID)\(Env.appGroup)"
    return keychain
  }

  func getAccessToken(userID: User.ID) -> String {
    self.get("accessToken-\(userID)")!
  }

  public func setAccessToken(userID: User.ID, accessToken: String) {
    self.set(accessToken, forKey: "accessToken-\(userID)")
  }
}
