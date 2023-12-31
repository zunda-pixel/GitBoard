//
//  AccountTimelineProvider.swift
//

import WidgetKit
import Defaults
import GitBoardUI
import Nuke

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
    
    let icon: PlatformImage?
    
    do {
      icon = try await ImagePipeline.shared.image(for: user.avatarURL)
    } catch {
      icon = nil
    }
    
    return .init(date: .now, user: user, color: configuration.color.color, icon: icon)

  }
  
  func timeline(for configuration: AccountConfiguration, in context: Context) async -> Timeline<AccountEntry> {        
    guard let user = UserDefaults.shared[.currentUser] else {
      return .init(entries: [.init(date: .now, user: nil, color: configuration.color.color, icon: nil)], policy: .never)
    }
    
    let icon: PlatformImage?
    
    do {
      icon = try await ImagePipeline.shared.image(for: user.avatarURL)
    } catch {
      icon = nil
    }
    
    return .init(entries: [.init(date: .now, user: user, color: configuration.color.color, icon: icon)], policy: .atEnd)
  }
}
