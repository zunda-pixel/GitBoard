//
//  ContentView.swift
//

import SwiftUI
import GitBoardData

public struct ContentView: View {
  public var account: Account = Account(name: "Account Name")

  public init() {
  }

  public var body: some View {
    Text(account.name)
  }
}

