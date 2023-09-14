//
//  IconRepositoryUserName.swift
//

import SwiftUI
import GitBoardData
import GitHubData

struct IconRepositoryUserName: View {
  @Environment(NavigationRouter.self) var router
  
  let owner: GitHubData.User
  let repository: GitHubData.Repository
  let imageSize: CGFloat
  
  var body: some View {
    HStack(alignment: .center, spacing: 15) {
      UserProfileImage(
        avatarURL: owner.avatarURL,
        type: owner.type
      )
      .frame(width: imageSize, height: imageSize)
      .onTapGesture {
        router.items.append(.userDetail(user: owner))
      }

      HStack(alignment: .center, spacing: 3) {
        Text(owner.userID)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.userDetail(user: owner))
          }
        
        Text("/")
          .foregroundStyle(.secondary)
        
        Text(repository.name)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: repository))
          }
      }
    }
  }
}

#Preview{
  IconRepositoryUserName(owner: .apple, repository: .swift, imageSize: 30)
    .environment(NavigationRouter())
}
