//
//  AccountTimelineProvider.swift
//

import SwiftUI
import WidgetKit
import Defaults

struct AccountTimelineProvider: TimelineProvider {
  let color: Color = .blue
  
  typealias Entry = AccountEntry
  
  func placeholder(in context: Context) -> Entry {
    .init(user: Default(.currentUser).wrappedValue, color: color, icon: nil)
  }
  
  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    Task {
      guard let user = await Default(.currentUser).wrappedValue else {
        completion(.init(user: nil, color: color, icon: nil))
        return
      }
      
      let (data, _) = try await URLSession.shared.data(from: user.avatarURL)
      let image = ImageData(data: data)
      
      completion(.init(user: user, color: color, icon: image))
    }
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    Task {
      guard let user = await Default(.currentUser).wrappedValue else {
        completion(.init(entries: [.init(user: nil, color: color, icon: nil)], policy: .never))
        return
      }
      
      let (data, _) = try await URLSession.shared.data(from: user.avatarURL)
      let icon = ImageData(data: data)
      
      completion(.init(entries: [.init(user: user, color: color, icon: icon)], policy: .never))
    }
  }
}
