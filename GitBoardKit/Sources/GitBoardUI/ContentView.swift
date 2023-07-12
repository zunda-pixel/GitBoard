//
//  ContentView.swift
//

import SwiftUI
import GitBoardData
import GitHubKit

public struct ContentView: View {
  @AppStorage(UserDefaults.UserDefaultsKey.currentUserID.rawValue, store: .shared) var currentUserID: Int?
  @State var splitMode: NavigationStyle = .tab
  @State var selectedTab: TabItem = .search
  var bindingSelectedTab: Binding<TabItem?> {
    .init {
      selectedTab
    } set: { newValue in
      guard let newValue else { return }
      selectedTab = newValue
    }
  }
  
  public init() {
  }

  @ViewBuilder
  func tabContent(tab: TabItem) -> some View {
    switch tab {
    case .search:
      SearchView()
    }
  }
  
  @ViewBuilder
  func tabView() -> some View {
    TabView(selection: $selectedTab) {
      ForEach(TabItem.allCases) { tab in
        tabContent(tab: tab)
          .tag(tab)
          .tabItem {
            Label(tab.label.text, systemImage: tab.label.systemImage)
          }
      }
    }
  }
  
  @ViewBuilder
  func content() -> some View {
    switch splitMode {
    case .split:
      NavigationSplitView {
        List(selection: bindingSelectedTab) {
          ForEach(TabItem.allCases) { tab in
            Text(tab.rawValue)
              .tag(tab)
          }
        }
      } detail: {
        tabView()
      }
    case .tab:
      tabView()
    }
  }
  
  public var body: some View {
    content()
      .defaultStyle()
      .font(.callout)
      .handlesExternalEvents(preferring: ["gitboard"], allowing: [])
  }
}

private extension View {
  func defaultStyle() -> some View {
    self
      .listStyle(.plain)
      .buttonStyle(.plain)
      .formStyle(.columns)
      .menuStyle(.borderlessButton)
      .gaugeStyle(.accessoryCircular)
      .tableStyle(.inset)
      .pickerStyle(.inline)
      .labelStyle(.automatic)
      .toggleStyle(.switch)
  }
}
