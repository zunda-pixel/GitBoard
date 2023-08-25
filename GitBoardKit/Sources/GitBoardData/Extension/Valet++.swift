//
//  Valet++.swift
//

import Foundation
import GitHubData
import Valet

extension Valet {
  public static var shared: Valet {
    Valet.sharedGroupValet(
      with: .init(appIDPrefix: Env.appIdentifierPrefix, nonEmptyGroup: Env.appGroup)!,
      identifier: nil,
      accessibility: .afterFirstUnlock
    )
  }

  public func getAccessToken(userID: GitHubData.User.ID) -> String {
    try! self.string(forKey: "accessToken-\(userID)")
  }

  public func setAccessToken(userID: GitHubData.User.ID, accessToken: String) {
    try! self.setString(accessToken, forKey: "accessToken-\(userID)")
  }
}
