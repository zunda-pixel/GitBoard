//
//  UserCell.swift
//

import SwiftUI
import CachedAsyncImage
import GitHubKit

struct UserCell: View {
  let user: User
  
  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      let circleLineWidth: CGFloat = 3
      let profileImageSize: CGFloat = 60
      
      CachedAsyncImage(url: user.avatarURL) { image in
        image.resizable()
      } placeholder: {
        Image(systemName: "person")
          .resizable()
          .padding(10)
      }
      .frame(width: profileImageSize, height: profileImageSize)
      .clipShape(.circle)
      .padding(circleLineWidth / 2)
      .overlay {
        Circle()
          .stroke(.thinMaterial, lineWidth: circleLineWidth)
      }

      VStack(alignment: .leading, spacing: 4) {
        HStack(alignment: .center, spacing: 5) {
          if let name = user.userName {
            Text(name)
            
            Text(user.userID)
              .foregroundStyle(.secondary)
          } else {
            Text(user.userID)
          }
        }
        
        if let bio = user.bio {
          Text(bio)
        }
        
        HStack(alignment: .center, spacing: 10) {
          if let company = user.company {
            Text("\(Image(systemName: "building")) \(company)")
              .font(.caption)
          }
          
          if let location = user.location {
            Text("\(Image(systemName: "location")) \(location)")
              .font(.caption)
          }
        }
      }
    }
  }
}

struct UserCell_Preview: PreviewProvider {
  static var previews: some View {
    let user = User(
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
    
    List {
      UserCell(user: user)
      UserCell(user: user)
      UserCell(user: user)
    }
    .listStyle(.plain)
  }
}
