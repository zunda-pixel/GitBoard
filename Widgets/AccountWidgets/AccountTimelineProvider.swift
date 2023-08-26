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
    guard let user = UserDefaults.shared[.currentUser] else {
      return .init(date: .now, user: nil, color: configuration.color.color, icon: nil)
    }
    
    let icon: ImageData?
    
    do {
      let (data, _) = try await URLSession.shared.data(from: user.avatarURL)
      icon = ImageData(data: data)
    } catch {
      icon = nil
    }
    
    return .init(date: .now, user: user, color: configuration.color.color, icon: icon)

  }
  
  func timeline(for configuration: AccountConfiguration, in context: Context) async -> Timeline<AccountEntry> {
    let policy: TimelineReloadPolicy = .never
        
    guard let user = UserDefaults.shared[.currentUser] else {
      return .init(entries: [.init(date: .now, user: nil, color: configuration.color.color, icon: nil)], policy: policy)
    }
    
    let icon: ImageData?
    
    do {
      let (data, _) = try await URLSession.shared.data(from: user.avatarURL)
      icon = ImageData(data: data)
    } catch {
      icon = nil
    }
    
    return .init(entries: [.init(date: .now, user: user, color: configuration.color.color, icon: icon)], policy: policy)
  }
}
