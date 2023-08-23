//
//  User++.swift
//

import Foundation
import GitHubAPI
import GitBoardData

extension GitHubData.User: RawRepresentable {
  public init?(rawValue: String) {
    let decoder = JSONDecoder.github
    let data = Data(rawValue.utf8)
    let user = try! decoder.decode(User.self, from: data)
    self = user
  }

  public var rawValue: String {
    let encoder = JSONEncoder.github
    let data = try! encoder.encode(self)
    return String(data: data, encoding: .utf8)!
  }
}

extension GitHubData.User: UserProtocol {
  public func update(user: some GitBoardData.UserProtocol) {
  }
}
