//
//  GitHubAPI++.swift
//

import Foundation
import GitHubAPI
import KeychainSwift

extension GitHubAPI {
  public init() {
    let userID = UserDefaults.shared.currentUserID
    
    guard let userID else {
      self = .init(type: .withoutToken)
      return
    }
    
    let accessToken = KeychainSwift.shared.getAccessToken(userID: userID)
    let githubKit = GitHubAPI(accessToken: accessToken)
    self = githubKit
  }
}
