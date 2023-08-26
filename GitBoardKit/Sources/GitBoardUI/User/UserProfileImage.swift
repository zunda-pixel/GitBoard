//
//  UserProfileImage.swift
//

import CachedAsyncImage
import GitHubAPI
import SwiftUI

struct UserProfileImage: View {
  let avatarURL: URL
  let type: UserType
  let roundWidth: CGFloat

  init(
    avatarURL: URL,
    type: UserType,
    roundWidth: CGFloat = 4
  ) {
    self.avatarURL = avatarURL
    self.type = type
    self.roundWidth = roundWidth
  }

  var body: some View {
    CachedAsyncImage(url: avatarURL) { image in
      image
        .resizable()
    } placeholder: {
      Image(systemName: "person")
        .resizable()
    }
    .overlay {
      UserProfileImageShape(
        type: type, cornerSize: .init(width: roundWidth * 2, height: roundWidth * 2)
      )
      .stroke(.thinMaterial, lineWidth: roundWidth)
    }
    .clipShape(
      UserProfileImageShape(
        type: type, cornerSize: .init(width: roundWidth * 2, height: roundWidth * 2))
    )
  }
}
