//
//  SelectableColor.swift
//

import AppIntents
import SwiftUI

enum SelectableColor: String, CaseIterable, AppEntity {
  static var defaultQuery: SelectableColorQuery = .init()
  
  var id: String { rawValue }
  
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "typeDisplayRepresentation"
  
  var displayRepresentation: DisplayRepresentation { DisplayRepresentation(stringLiteral: rawValue.uppercased()) }
  
  case red
  case blue
  case yellow
  case green
  case orange
  case brown
  case purple
  case cyan
  case mint
  case indigo
  
  static let `default`: SelectableColor = .cyan
  
  var color: Color {
    switch self {
    case .blue: return .blue
    case .red: return .red
    case .yellow:  return .yellow
    case .green:  return .green
    case .orange:  return .orange
    case .brown:  return .brown
    case .purple:  return .purple
    case .cyan:  return .cyan
    case .mint: return .mint
    case .indigo: return .indigo
    }
  }
}

struct SelectableColorQuery: EntityQuery {
  typealias Entity = SelectableColor
  
  func entities(for identifiers: [Entity.ID]) async throws -> [Entity] {
    return SelectableColor.allCases.filter {
      identifiers.contains($0.id)
    }
  }
  
  func suggestedEntities() async throws -> [Entity] {
    return SelectableColor.allCases
  }
  
  func defaultResult() async -> Entity? {
    return SelectableColor.default
  }
}
