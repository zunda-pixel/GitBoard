//
//  Label.swift
//

import Foundation
import GitHubData

public struct Label: Codable {
  public let name: String
  public let color: String
  public let createdAt: Date
  public let _description: String
  public let isDefault: Bool
  public let resourcePath: String
  public let updatedAt: Date
  public let url: URL
  
  public init(
    name: String,
    color: String,
    createdAt: Date,
    _description: String,
    isDefault: Bool,
    resourcePath: String,
    updatedAt: Date,
    url: URL
  ) {
    self.name = name
    self.color = color
    self.createdAt = createdAt
    self._description = _description
    self.isDefault = isDefault
    self.resourcePath = resourcePath
    self.updatedAt = updatedAt
    self.url = url
  }
  
  public init(label: GitHubData.Discussion.Label) {
    self.name = label.name
    self.color = label.color
    self.createdAt = label.createdAt
    self._description = label.description
    self.isDefault = label.isDefault
    self.resourcePath = label.resourcePath
    self.updatedAt = label.updatedAt
    self.url = label.url
  }
}
