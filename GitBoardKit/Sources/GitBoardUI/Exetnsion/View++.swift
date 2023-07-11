//
//  View++.swift
//

import SwiftUI

extension View {
  func listRow() -> some View {
    self
      .frame(maxWidth: .infinity, alignment: .leading)
      .listRowInsets(EdgeInsets())
      .alignmentGuide(.listRowSeparatorLeading) { _ in
          return 0
      }
      .contentShape(.rect)
  }
}
