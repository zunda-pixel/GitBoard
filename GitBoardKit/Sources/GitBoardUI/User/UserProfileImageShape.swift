//
//  UserProfileImageShape.swift
//

import SwiftUI
import GitHubData


public struct UserProfileImageShape: Shape {
  public let type: UserType
  public let cornerSize: CGSize

  public init(type: UserType, cornerSize: CGSize) {
    self.type = type
    self.cornerSize = cornerSize
  }
  
  public func path(in rect: CGRect) -> Path {
    switch type {
    case .organization:
      RoundedRectangle(cornerSize: cornerSize).path(in: rect)
    case .user:
      Circle().path(in: rect)
    case .mannequin:  // TODO 謎
      Circle().path(in: rect)
    case .bot:
      Circle().path(in: rect)
    }
  }
}
