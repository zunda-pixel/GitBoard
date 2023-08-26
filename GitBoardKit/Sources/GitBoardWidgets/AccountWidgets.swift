//
//  AccountWidgets.swift
//

import SwiftUI
import WidgetKit
import AppIntents
import Defaults
import GitBoardData
import GitHubData
import GitBoardUI

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

struct AccountEntry: TimelineEntry {
  let date: Date
  let user: GitHubData.User?
  let color: Color = .yellow
  
  init(user: GitHubData.User?) {
    self.date = .now
    self.user = user
  }
}

struct AccountTimelineProvider: TimelineProvider {
  typealias Entry = AccountEntry
  
  func placeholder(in context: Context) -> Entry {
    .init(user: Default(.currentUser).wrappedValue)
  }
  
  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    completion(.init(user: Default(.currentUser).wrappedValue))
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    completion(.init(entries: [.init(user: Default(.currentUser).wrappedValue)], policy: .atEnd))
  }
}

struct AccountEntryView: View {
  let entry: AccountEntry
  let iconRoundWidth: CGFloat = 10
  let lineWidth: CGFloat = 10
  let viewCornerRadius: CGFloat = 24
  
  var body: some View {
    if let user = entry.user {
      accountView(user: user)
    } else {
      Text("Open to Login")
    }
  }
  
  func accountView(user: GitHubData.User) -> some View {
    VStack(alignment: .center, spacing: 0) {
      let imageData = try? Data(contentsOf: user.avatarURL)
      if let imageData,
         let image = ImageData(data: imageData) {
        Image(image: image)
          .resizable()
          .scaledToFit()
          .overlay {
            UserProfileImageShape(
              type: user.type,
              cornerSize: .init(width: iconRoundWidth * 2, height: iconRoundWidth * 2)
            )
            .stroke(.yellow, lineWidth: iconRoundWidth)
            .padding(iconRoundWidth)
          }
          .clipShape(
            UserProfileImageShape(
              type: user.type,
              cornerSize: .init(width: iconRoundWidth * 2, height: iconRoundWidth * 2)
            )
          )
      } else {
        Text("Image Nothing")
      }
      
      if let userName = user.userName {
        Text(userName)
          .bold()
        
        Text(user.userID)
          .foregroundStyle(.secondary)
      } else {
        Text(user.userID)
          .bold()
      }
    }
    .frame(
      maxWidth: .infinity,
      maxHeight: .infinity
    )
  }
}

public struct AccountWidgets: Widget {
  let kind: String = "Account Widgets"
  
  public init() {
    
  }
  
  var widgetFamilies: [WidgetFamily] {
    #if os(macOS)
    [.systemSmall]
    #else
    [.systemSmall, .accessoryRectangular]
    #endif
  }
  
  public var body: some WidgetConfiguration {
    StaticConfiguration(
      kind: kind,
      provider: AccountTimelineProvider()
    ) { entry in
      AccountEntryView(entry: entry)
        .padding(10)
        .containerBackground(for: .widget) {
          LinearGradient(
            colors: [
              entry.color,
              entry.color.opacity(0.5)
            ],
            startPoint: .top,
            endPoint: .bottom
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
  AccountEntry(user: .zunda)
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
