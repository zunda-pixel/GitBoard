//
//  Sample.swift
//

import Foundation
import GitHubKit

extension User {
  static let sample = User(
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

extension Issue {
  static let sample = Issue(
    id: 123,
    number: 312,
    title: "[cxx-interop] div is not found on linux.",
    body: "Title",
    bodyHTML: "bodyHTML",
    bodyText: "bodyText",
    user: .sample,
    nodeID: "nodeID",
    url: URL(string: "https://github.com")!,
    repositoryURL: URL(string: "https://github.com")!,
    labelsURL: URL(string: "https://github.com")!,
    commentsURL: URL(string: "https://github.com")!,
    eventsURL: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    labels: [
      .init(id: 111, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "bug", color: "ff11bb", isDefault: true, description: "description"),
      .init(id: 222, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "existentials", color: "2211bb44", isDefault: true, description: "description"),
      .init(id: 333, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "existential member accesses", color: "9211bb44", isDefault: true, description: "description"),
      .init(id: 444, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "inout parameters", color: "22114b44", isDefault: true, description: "description"),
      .init(id: 555, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "variadic generics", color: "2499bb94", isDefault: true, description: "description"),
      .init(id: 666, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "multi-statement closures", color: "9911bb44", isDefault: true, description: "description"),
    ],
    state: .closed,
    locked: false,
    assignee: .sample,
    assignees: [],
    milestone: .sample,
    commentsCount: 312,
    createdAt: .now,
    updatedAt: .now.addingTimeInterval(-6000),
    closedAt: nil,
    authorAssociation: .collaborator,
    activeLockReason: .tooHeated,
    draft: false,
    pullRequest: .sample,
    reactions: .sample,
    timelineURL: URL(string: "https://github.com")!,
    performedViaGitHubApp: .sample,
    stateReason: .completed,
    closedBy: .sample,
    repository: .sample
  )
}

extension PerformGitHubApp {
  static let sample = PerformGitHubApp(
    id: 231312,
    slug: "slug",
    nodeID: "nodeID",
    owner: .sample,
    name: "name",
    description: "description",
    externalURL: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    createdAt: .now,
    updatedAt: .now,
    permissions: .init(admin: true, maintain: false, push: true, triage: true, pull: true),
    installationsCount: 312,
    clientID: "clientID",
    clientSecret: "clientSecret",
    webhookSecret: "webHook",
    pem: "pem"
  )
}

extension Reaction {
  static let sample = Reaction(
    url: URL(string: "https://github.com")!,
    totalCount: 213,
    plusOne: 31,
    minusOne: 441,
    laughCount: 123,
    hoorayCount: 444,
    confusedCount: 123,
    heartCount: 412,
    rockerCount: 12312,
    eyesCount: 312
  )
}

extension PullRequest {
  static let sample = PullRequest(
    url: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    diffURL: URL(string: "https://github.com")!,
    patchURL: URL(string: "https://github.com")!,
    mergedAt: .now
  )
}


extension Milestone {
  static let sample = Milestone(
    id: 312,
    nodeID: "nodeID",
    state: .closed,
    number: 42,
    title: "Titlw",
    description: "description",
    url: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    labelsURL: URL(string: "https://github.com")!,
    creator: .sample,
    openIssueCount: 312,
    closedIssueCount: 3,
    createdAt: .now,
    updatedAt: .now,
    closedAt: .now,
    dueOn: .now
  )
}
