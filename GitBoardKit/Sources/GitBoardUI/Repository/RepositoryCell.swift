//
//  RepositoryCell.swift
//

import GitHubAPI
import SwiftUI

struct RepositoryCell: View {
  let repository: Repository

  @ViewBuilder
  func starView(count: Int) -> some View {
    HStack(alignment: .center, spacing: 0) {
      Image(systemName: "star")
      Text("\(count)")
    }
  }

  @ViewBuilder
  func languageView(language: String) -> some View {
    HStack(alignment: .center, spacing: 0) {
      Image(systemName: "circle.fill")
      Text(language)
    }
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      let profileImageSize: CGFloat = 35

      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(
          avatarURL: repository.owner!.avatarURL,
          type: repository.owner!.type,
          roundWidth: 2
        )
        .frame(width: profileImageSize, height: profileImageSize)

        Text(repository.owner!.userID)
      }
      .foregroundStyle(.secondary)

      Text(repository.name)
        .bold()

      if let description = repository.description {
        Text(description)
          .foregroundStyle(.secondary)
      }

      HStack(alignment: .center, spacing: 20) {
        if let stargazersCount = repository.stargazersCount {
          starView(count: stargazersCount)
        }
        if let language = repository.language {
          languageView(language: language)
        }
      }
      .foregroundStyle(.secondary)
    }
  }
}

#Preview{
  List {
    RepositoryCell(repository: .swift)
  }
}
