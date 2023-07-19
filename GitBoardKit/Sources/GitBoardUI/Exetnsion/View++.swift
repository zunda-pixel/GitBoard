//
//  View++.swift
//

import SwiftUI

extension View {
  func listRow() -> some View {
    self
      .listRowInsets(EdgeInsets())
      .alignmentGuide(.listRowSeparatorLeading) { _ in
        return 0
      }
      .contentShape(.rect)
      .listRowSeparator(.hidden)
  }
}
