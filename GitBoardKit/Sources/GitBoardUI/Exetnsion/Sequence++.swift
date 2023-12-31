//
//  Sequence++.swift
//

import Algorithms
import Foundation

extension LazySequenceProtocol {
  public func uniqued<Value>(
    keyPath: KeyPath<Self.Element, Value>
  ) -> UniquedSequence<Self, Value> {
    self.uniqued { element in
      element[keyPath: keyPath]
    }
  }
}
