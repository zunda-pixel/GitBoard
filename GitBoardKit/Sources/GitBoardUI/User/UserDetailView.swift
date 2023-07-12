//
//  UserDetailView.swift
//

import SwiftUI
import GitHubKit

struct UserDetailView: View {
  let user: User
  
  var userProfileAndName: some View {
    HStack(alignment: .center, spacing: 10) {
      UserProfileImage(avatarURL: user.avatarURL, type: user.type)
        .frame(width: 80, height: 80)
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
    VStack(alignment: .center, spacing: 0) {
      userProfileAndName
      
      HStack(alignment: .center, spacing: 20) {
        if let company = user.company {
          Label(company, systemImage: "building")
        }
        
        if let location = user.location {
          Label(location, systemImage: "location")
        }
      }
      
      if let followerCount = user.followerCount,
         let followingCount = user.followingCount {
        HStack(alignment: .center, spacing: 5) {
          Image(systemName: "person")
          Text("\(followerCount)").bold()
          Text("followers")
            .foregroundStyle(.secondary)
          Text("\(followingCount)").bold()
          Text("following")
            .foregroundStyle(.secondary)
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
    NavigationLink(item: .repositories(userID: user.userID)) {
      Label {
        HStack(alignment: .center, spacing: 5) {
          Text("Repositories")
          Spacer()
          if let publicRepoCount = user.publicRepoCount {
            Text("\(publicRepoCount)")
          }
          if let ownedPrivateRepoCount = user.ownedPrivateRepoCount {
            Text("\(ownedPrivateRepoCount)")
          }
          if let totalPrivateRepoCount = user.totalPrivateRepoCount {
            Text("\(totalPrivateRepoCount)")
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
        .listRow()
      
      repositoryNavigation
        .listRow()
    }
    #if os(macOS)
    .listStyle(.inset)
    #else
    .listStyle(.plain)
    #endif
  }
}

#Preview {
  NavigationStack {
    UserDetailView(user: .sample)
  }
}
