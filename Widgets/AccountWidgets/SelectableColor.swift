//
//  SelectableColor.swift
//

import AppIntents
import SwiftUI

enum SelectableColor: String, CaseIterable, AppEnum {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "typeDisplayRepresentation"
  
  static var caseDisplayRepresentations: [SelectableColor : DisplayRepresentation] {
    return [
      .red: .init(title: .init(stringLiteral: "Red"), image: .init(systemName: "paintbrush")),
      .blue: .init(title: .init(stringLiteral: "Blue"), image: .init(systemName: "paintbrush")),
      .yellow: .init(title: .init(stringLiteral: "Yellow"), image: .init(systemName: "paintbrush")),
      .green: .init(title: .init(stringLiteral: "Green"), image: .init(systemName: "paintbrush")),
      .orange: .init(title: .init(stringLiteral: "Orange"), image: .init(systemName: "paintbrush")),
      .brown: .init(title: .init(stringLiteral: "Brown"), image: .init(systemName: "paintbrush")),
      .purple: .init(title: .init(stringLiteral: "Purple"), image: .init(systemName: "paintbrush")),
      .cyan: .init(title: .init(stringLiteral: "Cyan"), image: .init(systemName: "paintbrush")),
      .mint: .init(title: .init(stringLiteral: "Mint"), image: .init(systemName: "paintbrush")),
      .indigo: .init(title: .init(stringLiteral: "Indigo"), image: .init(systemName: "paintbrush")),
    ]
  }
    
  case red = "Red"
  case blue = "Blue"
  case yellow = "Yellow"
  case green = "Green"
  case orange = "Orange"
  case brown = "Brown"
  case purple = "Purple"
  case cyan = "Cyan"
  case mint = "Mint"
  case indigo = "Indigo"
  
  static let `default`: Self = .cyan
  
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
