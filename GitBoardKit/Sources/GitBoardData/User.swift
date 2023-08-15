//
//  User.swift
//

import Foundation
import SwiftData
import GitHubData

@Model
final public class User: Hashable, Sendable, Identifiable {
  @Attribute(.unique)
  public let id: Int
  public let userID: String
  public let userName: String?
  public let nodeID: String
  public let avatarURL: URL
  public let gravatarID: String
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
  public let score: Int?
  public let siteAdmin: Bool
  public let twitterUserName: String?
  public let company: String?
  public let diskUsage: Int?
  public let collaboratorCount: Int?
  public let twoFactorAuthentication: Bool?
  public let plan: Plan?
  
  public init(
    id: Int,
    userID: String,
    userName: String?,
    nodeID: String,
    avatarURL: URL,
    gravatarID: String,
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
    score: Int?,
    siteAdmin: Bool,
    twitterUserName: String?,
    company: String?,
    diskUsage: Int?,
    collaboratorCount: Int?,
    twoFactorAuthentication: Bool?,
    plan: Plan?
  ) {
    self.id = id
    self.userID = userID
    self.userName = userName
    self.nodeID = nodeID
    self.avatarURL = avatarURL
    self.gravatarID = gravatarID
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
    self.score = score
    self.siteAdmin = siteAdmin
    self.twitterUserName = twitterUserName
    self.company = company
    self.diskUsage = diskUsage
    self.collaboratorCount = collaboratorCount
    self.twoFactorAuthentication = twoFactorAuthentication
    self.plan = plan
  }
}
