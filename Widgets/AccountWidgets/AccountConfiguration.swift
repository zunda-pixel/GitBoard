//
//  AccountEntry.swift
//

import SwiftUI
import AppIntents

struct AccountConfiguration: WidgetConfigurationIntent {
  static var title: LocalizedStringResource = "Account"
  static var description = IntentDescription("Shows Account Module")
  
  @Parameter(
    title: "Widget Color",
    description: "Selected Color is showed in background",
    default: SelectableColor.cyan
  ) var color: SelectableColor
}
