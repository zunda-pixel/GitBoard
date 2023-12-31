//
//  ContentView.swift
//

import Defaults
import GitBoardData
import GitHubData
import SwiftUI
import ToastView

public struct ContentView: View {
  @Default(.currentUser) var currentUser: GitHubData.User?

  @State var errorHandle = ErrorHandle()
  @State var navigationStyle: NavigationStyle = .tab
  @State var isTap = false
  @State var tabTappedTwice: [TabItem: TabTrigger] = .init(
    uniqueKeysWithValues: TabItem.allCases.map { ($0, .init()) }
  )
  @SceneStorage("ContentView.selectedTab") var selectedTab: TabItem = .home

  var bindingSelectedTab: Binding<TabItem> {
    .init {
      selectedTab
    } set: { newValue in
      if newValue == selectedTab {
        tabTappedTwice[newValue]!.fire()
      }
      selectedTab = newValue
    }
  }

  var bindingSelectedTabOptional: Binding<TabItem?> {
    .init {
      selectedTab
    } set: { newValue in
      guard let newValue else { return }
      if newValue == selectedTab {
        tabTappedTwice[newValue]!.fire()
      }
      selectedTab = newValue
    }
  }

  public init() {
  }

  @ViewBuilder
  func tabContent(tab: TabItem, user: GitHubData.User) -> some View {
    switch tab {
    case .home:
      HomeNavigationView(trigger: tabTappedTwice[tab]!)
    case .notifications:
      NotificationsNavigationView(trigger: tabTappedTwice[tab]!)
    case .profile:
      ProfileNavigationView(user: user, trigger: tabTappedTwice[tab]!)
    }
  }

  @ViewBuilder
  func tabView(user: GitHubData.User) -> some View {
    TabView(selection: bindingSelectedTab) {
      ForEach(TabItem.allCases) { tab in
        tabContent(tab: tab, user: user)
          .tag(tab)
          .tabItem {
            Label(tab.label.text, systemImage: tab.label.systemImage)
              // https://stackoverflow.com/questions/70057749/why-swiftui-tabitem-systemimage-is-filled
              .environment(\.symbolVariants, tab == selectedTab ? .fill : .none)
          }
      }
    }
  }

  @ViewBuilder
  func contentView(user: GitHubData.User) -> some View {
    switch navigationStyle {
    case .split:
      NavigationSplitView {
        List(selection: bindingSelectedTabOptional) {
          ForEach(TabItem.allCases) { tab in
            Text(tab.rawValue)
              .tag(tab)
          }
        }
      } detail: {
        tabView(user: user)
      }
    case .tab:
      tabView(user: user)
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

      LoginView(currentUser: $currentUser) {
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
    if let currentUser {
      contentView(user: currentUser)
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

extension View {
  fileprivate func defaultStyle() -> some View {
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
