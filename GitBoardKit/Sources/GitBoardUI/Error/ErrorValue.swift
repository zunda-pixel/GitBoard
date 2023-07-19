//
//  ErrorValue.swift
//

import Foundation

struct ErrorValue {
  let id: UUID
  let error: any Error

  init(id: UUID = UUID(), error: any Error) {
    self.id = id
    self.error = error
  }
}

extension ErrorValue: Equatable {
  static func == (lhs: ErrorValue, rhs: ErrorValue) -> Bool {
    lhs.id == rhs.id
  }
}
