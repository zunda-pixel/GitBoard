//
//  AccountTimelineProvider.swift
//

import WidgetKit
import Defaults

struct AccountTimelineProvider: AppIntentTimelineProvider {
  typealias Entry = AccountEntry
  typealias Intent = AccountConfiguration
  
  func placeholder(in context: Context) -> AccountEntry {
    return .init(user: Default(.currentUser).wrappedValue, color: SelectableColor.default.color, icon: nil)
  }
  
  func snapshot(for configuration: AccountConfiguration, in context: Context) async -> AccountEntry {
    guard let user = await Default(.currentUser).wrappedValue else {
      return .init(user: nil, color: configuration.color.color, icon: nil)
    }
    
    let response = try? await URLSession.shared.data(from: user.avatarURL)
    
    guard let data = response?.0 else {
      return .init(user: user, color: configuration.color.color, icon: nil)
    }
    
    let image = ImageData(data: data)
    
    return .init(user: user, color: configuration.color.color, icon: image)
  }
  
  func timeline(for configuration: AccountConfiguration, in context: Context) async -> Timeline<AccountEntry> {
    guard let user = await Default(.currentUser).wrappedValue else {
      return .init(entries: [.init(user: nil, color: configuration.color.color, icon: nil)], policy: .never)
    }
    
    let response = try? await URLSession.shared.data(from: user.avatarURL)
    
    guard let data = response?.0 else {
      return .init(entries: [.init(user: nil, color: configuration.color.color, icon: nil)], policy: .never)
    }
    
    let icon = ImageData(data: data)
    
    return .init(entries: [.init(user: user, color: configuration.color.color, icon: icon)], policy: .never)
  }
}
