//
//  AccountEntry.swift
//

import SwiftUI
import AppIntents

struct AccountConfiguration: WidgetConfigurationIntent {
  static var title: LocalizedStringResource = "Configuration"
  static var description = IntentDescription("This is an example widget.")

  // An example configurable parameter.
  @Parameter(title: "Widget Color", default: SelectableColor.red)
  var color: SelectableColor
}
