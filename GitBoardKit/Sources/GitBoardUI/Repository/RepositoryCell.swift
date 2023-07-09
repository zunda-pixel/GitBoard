//
//  RepositoryCell.swift
//

import SwiftUI
import GitHubKit
import CachedAsyncImage

struct RepositoryCell: View {
  let repository: Repository
  
  @ViewBuilder
  var starView: some View {
    HStack(alignment: .center, spacing: 0) {
      Image(systemName: "star")
      Text("\(repository.stargazersCount)")
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
      
      HStack(alignment: .top, spacing: 10) {
        UserProfileImage(
          avatarURL: repository.owner.avatarURL,
          type: repository.owner.type,
          roundWidth: 2
        )
        .frame(width: profileImageSize, height: profileImageSize)
        
        Text(repository.owner.userID)
      }
      .foregroundStyle(.secondary)

      
      Text(repository.name)
        .bold()
      
      if let description = repository.description {
        Text(description)
          .foregroundStyle(.secondary)
      }
      
      HStack(alignment: .center, spacing: 20) {
        starView
        if let language = repository.language {
          languageView(language: language)
        }
      }
      .foregroundStyle(.secondary)
    }
  }
}

struct RepositoryCell_Preview: PreviewProvider {
  static var previews: some View {
    List {
      RepositoryCell(repository: .sample)
    }
  }
}

extension Repository {
  static let sample = Repository(
    id: 321312,
    nodeID: "flasjd",
    name: "swift",
    fullName: "apple/swift",
    isPrivate: false,
    owner: User.sample,
    htmlURL: URL(string: "https://github.com")!,
    description: "Swift",
    isFork: false,
    url: URL(string: "https://github.com")!,
    forksURL: URL(string: "https://github.com")!,
    keysURL: URL(string: "https://github.com")!,
    collaboratorsURL: URL(string: "https://github.com")!,
    teamsURL: URL(string: "https://github.com")!,
    hooksURL: URL(string: "https://github.com")!,
    issueEventsURL: URL(string: "https://github.com")!,
    eventsURL: URL(string: "https://github.com")!,
    assigneesURL: URL(string: "https://github.com")!,
    branchesURL: URL(string: "https://github.com")!,
    tagsURL: URL(string: "https://github.com")!,
    blobsURL: URL(string: "https://github.com")!,
    gitTagsURL: URL(string: "https://github.com")!,
    gitRefsURL: URL(string: "https://github.com")!,
    treesURL: URL(string: "https://github.com")!,
    statusesURL: URL(string: "https://github.com")!,
    languagesURL: URL(string: "https://github.com")!,
    stargazersURL: URL(string: "https://github.com")!,
    contributorsURL: URL(string: "https://github.com")!,
    subscribersURL: URL(string: "https://github.com")!,
    subscriptionURL: URL(string: "https://github.com")!,
    commitsURL: URL(string: "https://github.com")!,
    gitCommitsURL: URL(string: "https://github.com")!,
    commentsURL: URL(string: "https://github.com")!,
    issueCommentURL: URL(string: "https://github.com")!,
    contentsURL: URL(string: "https://github.com")!,
    compareURL: URL(string: "https://github.com")!,
    mergesURL: URL(string: "https://github.com")!,
    archiveURL: URL(string: "https://github.com")!,
    downloadsURL: URL(string: "https://github.com")!,
    issuesURL: URL(string: "https://github.com")!,
    pullsURL: URL(string: "https://github.com")!,
    milestonesURL: URL(string: "https://github.com")!,
    notificationsURL: URL(string: "https://github.com")!,
    labelsURL: URL(string: "https://github.com")!,
    releasesURL: URL(string: "https://github.com")!,
    deploymentsURL: URL(string: "https://github.com")!,
    createdAt: .now,
    updatedAt: .now,
    pushedAt: .now,
    gitURL: URL(string: "https://github.com")!,
    sshURL: URL(string: "https://github.com")!,
    cloneURL: URL(string: "https://github.com")!,
    svnURL: URL(string: "https://github.com")!,
    homepage: "https://apple.com",
    size: 12312,
    stargazersCount: 312,
    watchersCount: 1231,
    language: "C++",
    hasIssues: true,
    hasProjects: false,
    hasDownloads: true,
    hasWiki: false,
    hasPages: true,
    hasDiscussions: false,
    forksCount: 312,
    mirrorURL: nil,
    isArchived: false,
    disabled: false,
    openIssuesCount: 1231,
    license: nil,
    allowForking: true,
    isTemplate: false,
    webCommitSignOffRequired: false,
    topics: [
      "Apple", "swift"
    ],
    visibility: .public,
    defaultBranch: "main",
    permissions: nil,
    score: 312
  )
}
