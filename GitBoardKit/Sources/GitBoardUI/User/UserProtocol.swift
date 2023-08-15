//
//  UserProtocol.swift
//

import Foundation
import GitBoardData
import GitHubData

protocol UserProtocol {
  var avatarURL: URL { get }
  var type: UserType { get }
  var userName: String? { get }
  var userID: String { get }
  var bio: String? { get }
  var company: String? { get }
  var location: String? { get }
}

extension GitHubData.User: UserProtocol {
  
}

extension GitBoardData.User: UserProtocol {
  
}
