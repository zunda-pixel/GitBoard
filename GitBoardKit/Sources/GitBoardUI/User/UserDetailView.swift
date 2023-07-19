//
//  UserDetailView.swift
//

import GitHubAPI
import SwiftUI

struct UserDetailView: View {
  @Environment(NavigationRouter.self) var router

  let user: User

  var userProfileAndName: some View {
    HStack(alignment: .center, spacing: 10) {
      UserProfileImage(avatarURL: user.avatarURL, type: user.type)
        .frame(width: 50, height: 50)
      VStack(alignment: .leading, spacing: 0) {
        if let userName = user.userName {
          Text(userName)
        }

        Text(user.userID)
          .foregroundStyle(.secondary)
      }
    }
  }

  var userProfile: some View {
    VStack(alignment: .leading, spacing: 10) {
      userProfileAndName

      HStack(alignment: .center, spacing: 10) {
        if let company = user.company {
          Label(company, systemImage: "building")
        }

        if let location = user.location {
          Label(location, systemImage: "location")
        }

        if let twitterUserName = user.twitterUserName {
          Link(destination: URL(string: "https://twitter.com/\(twitterUserName)")!) {
            Label("@\(twitterUserName)", systemImage: "bird")
          }
        }
      }
      .lineLimit(1)
      .labelStyle(.titleAndIcon)

      if let followerCount = user.followerCount,
        let followingCount = user.followingCount
      {
        HStack(alignment: .center, spacing: 10) {
          Image(systemName: "person.2")

          HStack(alignment: .center, spacing: 5) {
            Text("\(followerCount)").bold()
            Text("followers")
              .foregroundStyle(.secondary)
          }
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.followers(userID: user.userID))
          }

          HStack(alignment: .center, spacing: 5) {
            Text("\(followingCount)").bold()
            Text("following")
              .foregroundStyle(.secondary)
          }
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.following(userID: user.userID))
          }
        }
      }
    }
  }

  var userView: some View {
    VStack(alignment: .center, spacing: 10) {
      HStack(alignment: .center, spacing: 0) {
        userProfile
        Spacer()
      }

      Button {

      } label: {
        Label("Follow", systemImage: "plus")
          .frame(maxWidth: 200)
      }
      .buttonStyle(.bordered)
    }
  }

  var repositoryNavigation: some View {
    NavigationLink(item: .userRepositories(ownerID: user.userID)) {
      Label {
        HStack(alignment: .center, spacing: 5) {
          Text("Repositories")
          Spacer()
          
          var count: Int {
            var sum = user.publicRepoCount ?? 0
            sum += user.ownedPrivateRepoCount ?? 0
            return sum
          }
          
          if count > 0 {
            Text("\(count)")
          }
        }
      } icon: {
        Image(systemName: "book.closed")
      }
    }
  }

  var body: some View {
    List {
      userView
        .padding(10)
        .listRow()

      Section {
        repositoryNavigation
      }
    }
    .listStyle(.plain)
  }
}

#Preview{
  NavigationStack {
    UserDetailView(user: .zunda)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
