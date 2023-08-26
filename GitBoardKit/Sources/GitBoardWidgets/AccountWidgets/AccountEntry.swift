//
//  AccountEntry.swift
//

import SwiftUI
import WidgetKit
import GitHubData

struct AccountEntry: TimelineEntry {
  let date: Date
  let user: GitHubData.User?
  let color: Color
  let icon: ImageData?
  
  init(user: GitHubData.User?, color: Color, icon: ImageData?) {
    self.date = .now
    self.user = user
    self.color = color
    self.icon = icon
  }
}
