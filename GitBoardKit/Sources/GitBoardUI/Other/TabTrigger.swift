//
//  TabTrigger.swift
//

import SwiftUI

/// TabTrigger
/// https://qiita.com/YusukeHosonuma/items/dc986c408e14106caf29
struct TabTrigger {
  private(set) var key: Bool = false
  
  mutating func fire() {
    key.toggle()
  }
}

extension View {
  func onTrigger(of trigger: TabTrigger, perform: @escaping () -> Void) -> some View {
    self.onChange(of: trigger.key) { _, _ in
      perform()
    }
  }
}
