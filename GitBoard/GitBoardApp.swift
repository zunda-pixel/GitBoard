//
//  GitBoardApp.swift
//  GitBoard
//
//  Created by zunda on 2023/06/28.
//

import SwiftUI
import SwiftData

@main
struct GitBoardApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
