//
//  ErrorHandle.swift
//

import Foundation
import Observation

@Observable
final class ErrorHandle {
  var error: ErrorValue? = nil
  
  init(error: ErrorValue? = nil) {
    self.error = error
  }
}
