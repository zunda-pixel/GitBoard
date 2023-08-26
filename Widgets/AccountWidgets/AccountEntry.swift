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
}
