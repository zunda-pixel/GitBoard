//
//  GitHubKit++.swift
//

import Foundation
import GitHubKit
import KeychainSwift

extension GitHubKit {
  public init() {
    let userID = UserDefaults.shared.currentUserID
    
    guard let userID else {
      self = .init(type: .withoutToken)
      return
    }
    
    let accessToken = KeychainSwift.shared.getAccessToken(userID: userID)
    let githubKit = GitHubKit(accessToken: accessToken)
    self = githubKit
  }
}