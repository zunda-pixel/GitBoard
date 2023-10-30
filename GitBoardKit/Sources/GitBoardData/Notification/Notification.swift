//
//  Notification.swift
//

import Foundation
import SwiftData
import GitHubData

@Model
final public class Notification {
  @Attribute(.unique)
  public let notificationID: String
  public let repository: Repository
  public let subject: Subject
  public let reason: GitHubData.Notification.Reason
  public let unread: Bool
  public let updatedAt: Date
  public let lastReadAt: Date?

  public init(
    id: String,
    repository: Repository,
    subject: Subject,
    reason: GitHubData.Notification.Reason,
    unread: Bool,
    updatedAt: Date,
    lastReadAt: Date?
  ) {
    self.notificationID = id
    self.repository = repository
    self.subject = subject
    self.reason = reason
    self.unread = unread
    self.updatedAt = updatedAt
    self.lastReadAt = lastReadAt
  }
  
  public convenience init(notification: GitHubData.Notification) {
    self.init(
      id: notification.id,
      repository: notification.repository,
      subject: notification.subject,
      reason: notification.reason,
      unread: notification.unread,
      updatedAt: notification.updatedAt,
      lastReadAt: notification.lastReadAt
    )
  }
}
