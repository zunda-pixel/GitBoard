//
//  User.swift
//

import Foundation
import GitHubData
import SwiftData

@Model
final public class User: Hashable, Identifiable {
  @Attribute(.unique)
  public let githubID: Int
  public var userID: String
  public var userName: String?
  public var avatarURL: URL
  public var publicRepoCount: Int?
  public var totalPrivateRepoCount: Int?
  public var ownedPrivateRepoCount: Int?
  public var publicGistsCount: Int?
  public var privateGistsCount: Int?
  public var followerCount: Int?
  public var followingCount: Int?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var bio: String?
  public var email: String?
  public var location: String?
  public var hireable: Bool?
  public var type: UserType
  public var siteAdmin: Bool
  public var twitterUserName: String?
  public var company: String?
  public var collaboratorCount: Int?
  public var twoFactorAuthentication: Bool?
  public var plan: Plan?
  
  public static func from(user: GitHubData.User) -> User {
    self.init(
      githubID: user.id,
      userID: user.userID,
      userName: user.userName,
      avatarURL: user.avatarURL,
      publicRepoCount: user.publicRepoCount,
      totalPrivateRepoCount: user.totalPrivateRepoCount,
      ownedPrivateRepoCount: user.ownedPrivateRepoCount,
      publicGistsCount: user.publicGistsCount,
      privateGistsCount: user.privateGistsCount,
      followerCount: user.followerCount,
      followingCount: user.followingCount,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      bio: user.bio,
      email: user.email,
      location: user.location,
      hireable: user.hireable,
      type: user.type,
      siteAdmin: user.siteAdmin,
      twitterUserName: user.twitterUserName,
      company: user.company,
      collaboratorCount: user.collaboratorCount,
      twoFactorAuthentication: user.twoFactorAuthentication,
      plan: user.plan
    )
  }

  private init(
    githubID: Int,
    userID: String,
    userName: String?,
    avatarURL: URL,
    publicRepoCount: Int?,
    totalPrivateRepoCount: Int?,
    ownedPrivateRepoCount: Int?,
    publicGistsCount: Int?,
    privateGistsCount: Int?,
    followerCount: Int?,
    followingCount: Int?,
    createdAt: Date?,
    updatedAt: Date?,
    bio: String?,
    email: String?,
    location: String?,
    hireable: Bool?,
    type: UserType,
    siteAdmin: Bool,
    twitterUserName: String?,
    company: String?,
    collaboratorCount: Int?,
    twoFactorAuthentication: Bool?,
    plan: Plan?
  ) {
    self.githubID = githubID
    self.userID = userID
    self.userName = userName
    self.avatarURL = avatarURL
    self.publicRepoCount = publicRepoCount
    self.totalPrivateRepoCount = totalPrivateRepoCount
    self.ownedPrivateRepoCount = ownedPrivateRepoCount
    self.publicGistsCount = publicGistsCount
    self.privateGistsCount = privateGistsCount
    self.followerCount = followerCount
    self.followingCount = followingCount
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.bio = bio
    self.email = email
    self.location = location
    self.hireable = hireable
    self.type = type
    self.siteAdmin = siteAdmin
    self.twitterUserName = twitterUserName
    self.company = company
    self.collaboratorCount = collaboratorCount
    self.twoFactorAuthentication = twoFactorAuthentication
    self.plan = plan
  }
}

extension User: UserProtocol {
  public func update(user: some UserProtocol) {
    self.userID = user.userID
    user.userName.map { self.userName = $0 }
    self.avatarURL = user.avatarURL
    user.publicRepoCount.map { self.publicRepoCount = $0 }
    user.totalPrivateRepoCount.map { self.totalPrivateRepoCount = $0 }
    user.ownedPrivateRepoCount.map { self.ownedPrivateRepoCount = $0 }
    user.publicGistsCount.map { self.publicGistsCount = $0 }
    user.privateGistsCount.map { self.privateGistsCount = $0 }
    user.followerCount.map { self.followerCount = $0 }
    user.followingCount.map { self.followingCount = $0 }
    user.createdAt.map { self.createdAt = $0 }
    user.updatedAt.map { self.updatedAt = $0 }
    user.bio.map { self.bio = $0 }
    user.email.map { self.email = $0 }
    user.location.map { self.location = $0 }
    user.hireable.map { self.hireable = $0 }
    self.type = user.type
    self.siteAdmin = user.siteAdmin
    user.twitterUserName.map { self.twitterUserName = $0 }
    user.company.map { self.company = $0 }
    user.collaboratorCount.map { self.collaboratorCount = $0 }
    user.twoFactorAuthentication.map { self.twoFactorAuthentication = $0 }
    user.plan.map { self.plan = $0 }
  }
}
