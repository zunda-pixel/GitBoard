//
//  UserProtocol.swift
//

import Foundation
import GitHubData

public protocol UserProtocol: Identifiable, Hashable {
  var avatarURL: URL { get }
  var type: UserType { get }
  var userName: String? { get }
  var userID: String { get }
  var bio: String? { get }
  var company: String? { get }
  var location: String? { get }
  var twitterUserName: String? { get }
  var followingCount: Int? { get }
  var followerCount: Int? { get }
  var ownedPrivateRepoCount: Int? { get }
  var publicRepoCount: Int? { get }
  var totalPrivateRepoCount: Int? { get }
  var publicGistsCount: Int? { get }
  var privateGistsCount: Int? { get }
  var createdAt: Date? { get }
  var updatedAt: Date? { get }
  var email: String? { get }
  var hireable: Bool? { get }
  var siteAdmin: Bool { get }
  var collaboratorCount: Int? { get }
  var twoFactorAuthentication: Bool? { get }
  var plan: Plan? { get }

  func update(user: some UserProtocol)
}
