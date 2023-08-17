//
//  User.swift
//

import Foundation
import SwiftData
import GitHubData

@Model
final public class User: Hashable, Sendable, Identifiable {
  public let userID: String
  public let userName: String?
  public let avatarURL: URL
  public let publicRepoCount: Int?
  public let totalPrivateRepoCount: Int?
  public let ownedPrivateRepoCount: Int?
  public let publicGistsCount: Int?
  public let privateGistsCount: Int?
  public let followerCount: Int?
  public let followingCount: Int?
  public let createdAt: Date?
  public let updatedAt: Date?
  public let bio: String?
  public let email: String?
  public let location: String?
  public let hireable: Bool?
  public let type: UserType
  public let siteAdmin: Bool
  public let twitterUserName: String?
  public let company: String?
  public let collaboratorCount: Int?
  public let twoFactorAuthentication: Bool?
  public let plan: Plan?
  
  public init(user: GitHubData.User) {
    self.userID = user.userID
    self.userName = user.userName
    self.avatarURL = user.avatarURL
    self.publicRepoCount = user.publicRepoCount
    self.totalPrivateRepoCount = user.totalPrivateRepoCount
    self.ownedPrivateRepoCount = user.ownedPrivateRepoCount
    self.publicGistsCount = user.publicGistsCount
    self.privateGistsCount = user.privateGistsCount
    self.followerCount = user.followerCount
    self.followingCount = user.followingCount
    self.createdAt = user.createdAt
    self.updatedAt = user.updatedAt
    self.bio = user.bio
    self.email = user.email
    self.location = user.location
    self.hireable = user.hireable
    self.type = user.type
    self.siteAdmin = user.siteAdmin
    self.twitterUserName = user.twitterUserName
    self.company = user.company
    self.collaboratorCount = user.collaboratorCount
    self.twoFactorAuthentication = user.twoFactorAuthentication
    self.plan = user.plan
  }
  
  public init(
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
