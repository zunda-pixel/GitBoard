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
  
  static let `default`: Self = .red
  
  var color: Color {
    switch self {
    case .blue: return .blue
    case .red: return .red
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
