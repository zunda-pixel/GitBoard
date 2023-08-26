//
//  AccountTimelineProvider.swift
//

import WidgetKit
import Defaults
import GitBoardUI

struct AccountTimelineProvider: AppIntentTimelineProvider {
  typealias Entry = AccountEntry
  typealias Intent = AccountConfiguration
  
  func placeholder(in context: Context) -> AccountEntry {
    let user = UserDefaults.shared[.currentUser]
    return .init(date: .now, user: user, color: SelectableColor.default.color, icon: nil)
  }
  
  func snapshot(for configuration: AccountConfiguration, in context: Context) async -> AccountEntry {
    let user = UserDefaults.shared[.currentUser]
    
    guard let user else {
      return .init(date: .now, user: nil, color: configuration.color.color, icon: nil)
    }
    
    let response = try? await URLSession.shared.data(from: user.avatarURL)
    
    guard let data = response?.0 else {
      return .init(date: .now, user: user, color: configuration.color.color, icon: nil)
    }
    
    let image = ImageData(data: data)
    
    return .init(date: .now, user: user, color: configuration.color.color, icon: image)
  }
  
  func timeline(for configuration: AccountConfiguration, in context: Context) async -> Timeline<AccountEntry> {
    let policy: TimelineReloadPolicy = .never
    
    let user = UserDefaults.shared[.currentUser]
    
    guard let user else {
      return .init(entries: [.init(date: .now, user: nil, color: configuration.color.color, icon: nil)], policy: policy)
    }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: user.avatarURL)
      
      let icon = ImageData(data: data)
      
      return .init(entries: [.init(date: .now, user: user, color: configuration.color.color, icon: icon)], policy: policy)
    } catch {
      return .init(entries: [.init(date: .now, user: user, color: configuration.color.color, icon: nil)], policy: policy)
    }
  }
}
