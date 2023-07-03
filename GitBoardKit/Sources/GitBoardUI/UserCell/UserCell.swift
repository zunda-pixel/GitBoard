//
//  UserCell.swift
//

import SwiftUI
import OctoKit
import CachedAsyncImage

struct UserCell: View {
  let user: User
  
  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      let circleLineWidth: CGFloat = 3
      let profileImageSize: CGFloat = 60
      
      CachedAsyncImage(url: URL(string: user.avatarURL!)!) { image in
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
          if let name = user.name {
            Text(name)
            
            Text(user.login!)
              .foregroundStyle(.secondary)
          } else {
            Text(user.login!)
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
      login: "zunda-pixel",
      avatarURL: "https://avatars.githubusercontent.com/u/47569369?v=4",
      name: "zunda",
      company: "Apple",
      location: "Japan",
      bio: "Hello GitHub",
      createdAt: Date.now
    )
    List {
      UserCell(user: user)
      UserCell(user: user)
      UserCell(user: user)
    }
    .listStyle(.plain)
  }
}
