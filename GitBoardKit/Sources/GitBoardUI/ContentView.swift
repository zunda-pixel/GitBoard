//
//  ContentView.swift
//

import SwiftUI
import GitBoardData
import GitHubKit

public struct ContentView: View {
  @AppStorage(UserDefaults.UserDefaultsKey.currentUserID.rawValue, store: .shared) var currentUserID: Int?
  @State var errorHandle = ErrorHandle()
  @State var navigationStyle: NavigationStyle = .tab
  @State var isTap = false
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
  var contentView:  some View {
    switch navigationStyle {
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
  
  @ViewBuilder
  var loginView: some View {
    VStack {
      Spacer()
      
      Image(systemName: "cat.circle.fill")
        .resizable()
        .frame(maxWidth: 100, maxHeight: 100)
        .bold()
        .foregroundStyle(.background, .foreground)
        .scaledToFit()
        .padding(20)
        .rotation3DEffect(
          .degrees(isTap ? 360 : 180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.smooth(duration: 1), value: isTap)
        .onTapGesture {
          isTap.toggle()
        }
      
      Spacer()
      
      LoginView(currentUserID: $currentUserID) {
        Text("Sign in to GitHub")
          .padding(20)
          .frame(maxWidth: 250)
          .bold()
          .foregroundStyle(.background)
          .background {
            Capsule()
          }
      }
      
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
  
  @ViewBuilder
  var loginOrContent: some View {
    if currentUserID != nil {
      contentView
    } else {
      loginView
    }
  }
  
  public var body: some View {
    loginOrContent
      .defaultStyle()
      .font(.callout)
      .handlesExternalEvents(preferring: ["gitboard"], allowing: [])
      .toastAlert(
        item: $errorHandle.error,
        position: .top,
        animation: .spring,
        duration: .seconds(2)
      ) { error in
        ErrorView(error: error.error)
      }
      .environment(errorHandle)
      .environment(\.defaultMinListRowHeight, 0)
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
