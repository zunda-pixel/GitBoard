//
//  AccountWidgets.swift
//

import SwiftUI
import WidgetKit
import GitHubData

struct AccountWidgets: Widget {
  let kind: String = "Account Widgets"
  
  var widgetFamilies: [WidgetFamily] {
    #if os(macOS)
    [.systemSmall]
    #else
    [.systemSmall, .accessoryRectangular]
    #endif
  }
  
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: kind, provider: AccountTimelineProvider()) { entry in
      AccountEntryView(entry: entry)
        .padding(10)
        .containerBackground(for: .widget) {
          LinearGradient(
            colors: [
              entry.color,
              entry.color.opacity(0.6)
            ],
            startPoint: .bottom,
            endPoint: .top
          )
        }
    }
    .contentMarginsDisabled()
    .supportedFamilies(widgetFamilies)
  }
}

#Preview(as: .systemSmall) {
  AccountWidgets()
} timeline: {
  AccountEntry(date: .now, user: .zunda, color: .cyan, icon: nil)
}

#if os(macOS)
typealias ImageData = NSImage
#else
typealias ImageData = UIImage
#endif

extension Image {
  #if os(macOS)
  init(image: ImageData) {
    self.init(nsImage: image)
  }
  #else
  init(image: ImageData) {
    self.init(uiImage: image)
  }
  #endif
}

extension GitHubData.User {
  static let zunda = GitHubData.User(
    id: 1234,
    userID: "zunda-pixel",
    userName: "zunda",
    nodeID: "",
    avatarURL: URL(string: "https://avatars.githubusercontent.com/u/47569369?v=4")!,
    gravatarID: "",
    url: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    followersURL: URL(string: "https://github.com")!,
    followingURL: URL(string: "https://github.com")!,
    subscriptionsURL: URL(string: "https://github.com")!,
    organizationsURL: URL(string: "https://github.com")!,
    reposURL: URL(string: "https://github.com")!,
    eventsURL: URL(string: "https://github.com")!,
    receivedEventsURL: URL(string: "https://github.com")!,
    gistsURL: URL(string: "https://github.com")!,
    starredURL: URL(string: "https://github.com")!,
    publicRepoCount: 1,
    totalPrivateRepoCount: 2,
    ownedPrivateRepoCount: 3,
    publicGistsCount: 2,
    privateGistsCount: 3,
    followerCount: 3,
    followingCount: 4,
    createdAt: .now,
    updatedAt: .now,
    bio: "bio",
    email: "email",
    location: "Japan",
    hireable: true,
    type: .user,
    score: 1,
    siteAdmin: true,
    twitterUserName: "zunda_pixel",
    company: "Apple",
    diskUsage: 12312,
    collaboratorCount: 0,
    twoFactorAuthentication: false,
    plan: .init(
      name: "free",
      space: 32,
      collaboratorCount: 342,
      privateRepoCount: 4234
    )
  )
}
