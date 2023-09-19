//
//  UserProfileImage.swift
//

import NukeUI
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
    LazyImage(url: avatarURL) { state in
      switch state.result {
      case .success(let result):
        #if os(macOS)
        Image(nsImage: result.image)
          .resizable()
        #else
        Image(uiImage: result.image)
          .resizable()
        #endif
      case .failure(_):
        Image(systemName: "person")
          .resizable()
          .overlay {
            Image(systemName: "xmark")
              .resizable()
              .foregroundStyle(.red)
          }
      case .none:
        ProgressView(
          value: state.progress.fraction,
          total: Float(state.progress.total)
        ) {
          Image(systemName: "person")
            .resizable()
            .frame(maxWidth: .infinity)
        }
      }
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

#Preview {
  UserProfileImage(
    avatarURL: URL(string: "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png12")!,
    type: .user
  )
  .frame(width: 100, height: 100)
}
