//
//  ReleaseDetailOnlineView.swift
//

import GitHubAPI
import SwiftUI

struct ReleaseDetailOnlineView: View {
  @Environment(ErrorHandle.self) var errorHandle

  let repository: Repository
  let releaseID: Int

  @State var release: Release? = nil

  func populate() async {
    do {
      self.release = try await GitHubAPI().release(
        ownerID: repository.owner!.userID,
        repositoryName: repository.name,
        releaseID: releaseID
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    ReleaseDetailView(repository: repository, release: release ?? .sample)
      .redacted(reason: release == nil ? .placeholder : [])
      .task {
        await populate()
      }
  }
}

#Preview{
  NavigationStack {
    ReleaseDetailOnlineView(
      repository: .nodejs,
      releaseID: 117697944
    )
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}

extension GitHubData.Repository {
  static let nodejs: Repository = .init(
    id: 123,
    nodeID: "",
    name: "next.js",
    fullName: "next.js",
    isPrivate: false,
    owner: .vercel,
    organization: nil,
    htmlURL: .applicationDirectory,
    _description: nil,
    isFork: false,
    url: .applicationDirectory,
    forksURL: .applicationDirectory,
    keysURL: .applicationDirectory,
    collaboratorsURL: .applicationDirectory,
    teamsURL: .applicationDirectory,
    hooksURL: .applicationDirectory,
    issueEventsURL: .applicationDirectory,
    eventsURL: .applicationDirectory,
    assigneesURL: .applicationDirectory,
    branchesURL: .applicationDirectory,
    tagsURL: .applicationDirectory,
    blobsURL: .applicationDirectory,
    gitTagsURL: .applicationDirectory,
    gitRefsURL: .applicationDirectory,
    treesURL: .applicationDirectory,
    statusesURL: .applicationDirectory,
    languagesURL: .applicationDirectory,
    stargazersURL: .applicationDirectory,
    contributorsURL: .applicationDirectory,
    subscribersURL: .applicationDirectory,
    subscriptionURL: .applicationDirectory,
    commitsURL: .applicationDirectory,
    gitCommitsURL: .applicationDirectory,
    commentsURL: .applicationDirectory,
    issueCommentURL: .applicationDirectory,
    contentsURL: .applicationDirectory,
    compareURL: .applicationDirectory,
    mergesURL: .applicationDirectory,
    archiveURL: .applicationDirectory,
    downloadsURL: .applicationDirectory,
    issuesURL: .applicationDirectory,
    pullsURL: .applicationDirectory,
    milestonesURL: .applicationDirectory,
    notificationsURL: .applicationDirectory,
    labelsURL: .applicationDirectory,
    releasesURL: .applicationDirectory,
    deploymentsURL: .applicationDirectory,
    createdAt: .now,
    updatedAt: .now,
    pushedAt: .now,
    gitURL: .applicationDirectory,
    sshURL: .applicationDirectory,
    cloneURL: .applicationDirectory,
    svnURL: .applicationDirectory,
    homepage: nil,
    size: nil,
    stargazersCount: nil,
    watchersCount: nil,
    language: nil,
    hasIssues: nil,
    hasProjects: nil,
    hasDownloads: nil,
    hasWiki: nil,
    hasPages: nil,
    hasDiscussions: nil,
    forksCount: nil,
    mirrorURL: .applicationDirectory,
    isArchived: nil,
    disabled: nil,
    openIssuesCount: nil,
    license: nil,
    allowForking: nil,
    isTemplate: nil,
    webCommitSignoffRequired: nil,
    topics: nil,
    visibility: nil,
    defaultBranch: nil,
    permissions: nil,
    roleName: nil,
    tempCloneToken: nil,
    deleteBranchOnMerge: nil,
    subscribersCount: nil,
    networkCount: nil,
    codeConduct: nil,
    securityAnalytics: nil,
    anonymousAccessEnabled: nil,
    starredAt: .now,
    masterBranch: nil,
    allowMergeCommit: nil,
    mergeCommitMessage: nil,
    mergeCommitTitle: nil,
    squashMergeCommitMessage: nil,
    squashMergeCommitTitle: nil,
    useSquashPrTitleAsDefault: nil,
    allowUpdateBranch: nil,
    allowAutoMerge: nil,
    allowSquashMerge: nil,
    allowRebaseMerge: nil,
    templateRepository: nil
  )
}

private extension GitHubData.User {
  static let vercel: GitHubData.User = .init(
    id: 12,
    userID: "vercel",
    userName: "vercel",
    nodeID: "",
    avatarURL: .init(string: "https://avatars.githubusercontent.com/u/14985020?s=200&v=4")!,
    gravatarID: "",
    url: .applicationDirectory,
    htmlURL: .applicationDirectory,
    followersURL: .applicationDirectory,
    followingURL: .applicationDirectory,
    subscriptionsURL: .applicationDirectory,
    organizationsURL: .applicationDirectory,
    reposURL: .applicationDirectory,
    eventsURL: .applicationDirectory,
    receivedEventsURL: .applicationDirectory,
    gistsURL: .applicationDirectory,
    starredURL: .applicationDirectory,
    publicRepoCount: nil,
    totalPrivateRepoCount: nil,
    ownedPrivateRepoCount: nil,
    publicGistsCount: nil,
    privateGistsCount: nil,
    followerCount: nil,
    followingCount: nil,
    createdAt: nil,
    updatedAt: nil,
    bio: nil,
    email: nil,
    location: nil,
    hireable: nil,
    type: .organization,
    score: nil,
    siteAdmin: true,
    twitterUserName: nil,
    company: nil,
    diskUsage: nil,
    collaboratorCount: nil,
    twoFactorAuthentication: nil,
    plan: nil
  )
}
