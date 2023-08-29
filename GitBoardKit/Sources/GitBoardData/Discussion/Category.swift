//
//  Category.swift
//

import Foundation
import GitHubData

public struct Category: Codable {
  public let createdAt: Date
  public let _description: String
  public let emoji: String
  public let emojiHTML: String
  public let isAnswerable: Bool
  public let name: String
  public let slug: String
  public let updateAt: Date?

  public init(
    createdAt: Date,
    _description: String,
    emoji: String,
    emojiHTML: String,
    isAnswerable: Bool,
    name: String,
    slug: String,
    updateAt: Date?
  ) {
    self.createdAt = createdAt
    self._description = _description
    self.emoji = emoji
    self.emojiHTML = emojiHTML
    self.isAnswerable = isAnswerable
    self.name = name
    self.slug = slug
    self.updateAt = updateAt
  }

  public init(category: GitHubData.Category) {
    self.createdAt = category.createdAt
    self._description = category.description
    self.emoji = category.emoji
    self.emojiHTML = category.emojiHTML
    self.isAnswerable = category.isAnswerable
    self.name = category.name
    self.slug = category.slug
    self.updateAt = category.updateAt
  }
}
