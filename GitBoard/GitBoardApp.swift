//
//  GitBoardApp.swift
//

import SwiftUI
import GitBoardUI
import SwiftData
import GitBoardData

@main
struct GitBoardApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: [
          GitBoardData.User.self,
          GitBoardData.Discussion.self,
        ])
    }
  }
}
