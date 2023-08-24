//
//  GitHubAPI++.swift
//

import Defaults
import Foundation
import GitHubAPI
import Valet

extension GitHubAPI {
  public init() {
    guard let user = Default(.currentUser).wrappedValue else {
      self.init(type: .withoutToken)
      return
    }

    let accessToken = Valet.shared.getAccessToken(userID: user.id)
    self.init(accessToken: accessToken)
  }
}
