//
//  AccountEntry.swift
//

import SwiftUI
import WidgetKit
import GitHubData
import Nuke

struct AccountEntry: TimelineEntry {
  let date: Date
  let user: GitHubData.User?
  let color: Color
  let icon: PlatformImage?
}
