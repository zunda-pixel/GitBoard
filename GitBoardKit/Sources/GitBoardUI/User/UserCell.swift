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
      let profileImageSize: CGFloat = 60
      
      UserProfileImage(
        avatarURL: user.avatarURL,
        type: user.type
      )
        .frame(width: profileImageSize, height: profileImageSize)

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
          }
          
          if let location = user.location {
            Text("\(Image(systemName: "location")) \(location)")
          }
        }
      }
    }
  }
}

#Preview {
  List {
    ForEach(0..<4) { _ in
      UserCell(user: .sample)
        .listRow()
    }
  }
  .listStyle(.plain)
}
