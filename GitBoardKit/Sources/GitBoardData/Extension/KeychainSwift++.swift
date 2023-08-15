//
//  KeychainSwift.swift
//

import Foundation
import GitHubData
import KeychainSwift

extension KeychainSwift {
  public static var shared: KeychainSwift {
    let keychain = KeychainSwift()
    keychain.accessGroup = "\(Env.teamID)\(Env.appGroup)"
    return keychain
  }

  func getAccessToken(userID: GitHubData.User.ID) -> String {
    self.get("accessToken-\(userID)")!
  }

  public func setAccessToken(userID: GitHubData.User.ID, accessToken: String) {
    self.set(accessToken, forKey: "accessToken-\(userID)")
  }
}
