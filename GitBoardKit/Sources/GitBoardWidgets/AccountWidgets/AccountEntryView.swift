//
//  AccountEntryView.swift
//

import Foundation
import SwiftUI
import GitHubData
import GitBoardUI

struct AccountEntryView: View {
  let entry: AccountEntry
  let iconRoundWidth: CGFloat = 10
  let lineWidth: CGFloat = 10
  let viewCornerRadius: CGFloat = 24 //fixed
  
  var body: some View {
    if let user = entry.user {
      accountView(user: user)
    } else {
      Text("Open to Login")
    }
  }
  
  var icon: Image {
    if let icon = entry.icon {
      return Image(image: icon)
    } else {
      return Image(systemName: "person")
    }
  }
  
  func accountView(user: GitHubData.User) -> some View {
    VStack(alignment: .center, spacing: 0) {
      icon
        .resizable()
        .scaledToFit()
        .clipShape(
          UserProfileImageShape(
            type: user.type,
            cornerSize: .init(width: iconRoundWidth * 2, height: iconRoundWidth * 2)
          )
        )
      
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
