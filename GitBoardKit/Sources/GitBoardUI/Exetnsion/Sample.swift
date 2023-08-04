//
//  Sample.swift
//

import Foundation
import GitHubAPI

extension Asset {
  static var sample: Asset {
    Asset(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      label: "label",
      state: .open,
      name: "name",
      url: URL(string: "https://github.com")!,
      browserDownloadURL: URL(string: "https://github.com")!,
      contentType: .zip,
      size: 1231,
      downloadCount: 32,
      createdAt: .now,
      updatedAt: .now,
      uploader: .apple
    )
  }
}

extension Release {
  static var sample: Release {
    Release(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      name: "name",
      url: URL(string: "https://github.com")!,
      htmlURL: URL(string: "https://github.com")!,
      assetsURL: URL(string: "https://github.com")!,
      uploadURL: URL(string: "https://github.com")!,
      tarballURL: URL(string: "https://github.com")!,
      zipballURL: URL(string: "https://github.com")!,
      tagName: "TagName",
      targetCommitish: "targetCommitish",
      body: "Body",
      draft: true,
      prerelease: true,
      createdAt: .now,
      publishedAt: .now,
      author: .apple,
      assets: [
        .sample,
        .sample
      ],
      bodyHTML: "bodyHTML",
      bodyText: "bodyText",
      mentionsCount: 123,
      discussionURL: URL(string: "https://github.com")!,
      reactions: .sample
    )
  }
}

extension User {
  static var sample: User {
    User(
      id: Int.random(in: Int.min...Int.max),
      userID: "apple",
      userName: "apple",
      nodeID: "",
      avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")!,
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
      type: .organization,
      score: 1,
      siteAdmin: true,
      twitterUserName: nil,
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

  static let apple = User(
    id: 11111,
    userID: "apple",
    userName: "apple",
    nodeID: "",
    avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")!,
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
    type: .organization,
    score: 1,
    siteAdmin: true,
    twitterUserName: nil,
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

  static let zunda = User(
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
  static let swift = Repository(
    id: 321312,
    nodeID: "",
    name: "swift",
    fullName: "apple/swift",
    isPrivate: false,
    owner: .apple,
    organization: .apple,
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
    webCommitSignoffRequired: false,
    topics: [
      "Apple", "swift",
    ],
    visibility: .public,
    defaultBranch: "main",
    permissions: nil,
    roleName: .admin,
    tempCloneToken: "tempCloneToken",
    deleteBranchOnMerge: true,
    subscribersCount: 100,
    networkCount: 100,
    codeConduct: .sample,
    securityAnalytics: .sample,
    anonymousAccessEnabled: true,
    starredAt: .now,
    masterBranch: "master",
    allowMergeCommit: true,
    mergeCommitMessage: .prBody,
    mergeCommitTitle: .prTitle,
    squashMergeCommitMessage: .prBody,
    squashMergeCommitTitle: .prTitle,
    useSquashPrTitleAsDefault: true,
    allowUpdateBranch: true,
    allowAutoMerge: true,
    allowSquashMerge: true,
    allowRebaseMerge: true,
    templateRepository: nil
  )
}

extension Subject {
  static let sample = Subject(
    title: "Title",
    url: URL(string: "https://github.com")!,
    latestCommitURL: URL(string: "https://github.com")!,
    type: .issue
  )
}
extension GitHubData.Notification {
  static var sample: GitHubData.Notification {
    .init(
      id: "\(Int.random(in: Int.min...Int.max))",
      repository: .swift,
      subject: .sample,
      reason: .author,
      unread: false,
      updatedAt: .now,
      lastReadAt: .now,
      url: URL(string: "https://github.com")!,
      subscriptionURL: URL(string: "https://github.com")!
    )
  }
}

extension CodeConduct {
  static let sample = CodeConduct(
    key: "contributor_covenant",
    name: "Contributor Covenant",
    url: URL(string: "https://github.com")!,
    body: "Contributor Covenant Code of Conduct",
    htmlURL: URL(string: "https://github.com")!
  )
}

extension SecurityAnalytics {
  static let sample = SecurityAnalytics(
    advancedSecurity: true,
    dependabotSecurityUpdates: true,
    secretScanning: true,
    secretScanningPushProtection: true
  )
}

extension Issue {
  static var sample: Issue {
    Issue(
      id: Int.random(in: Int.min...Int.max),
      number: 312,
      title: "[cxx-interop] div is not found on linux.",
      body: "Title",
      bodyHTML: "bodyHTML",
      bodyText: "bodyText",
      user: .apple,
      nodeID: "nodeID",
      url: URL(string: "https://github.com")!,
      repositoryURL: URL(string: "https://github.com")!,
      labelsURL: URL(string: "https://github.com")!,
      commentsURL: URL(string: "https://github.com")!,
      eventsURL: URL(string: "https://github.com")!,
      htmlURL: URL(string: "https://github.com")!,
      labels: [
        .init(
          id: 111, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "bug",
          color: "ff11bb", isDefault: true, description: "description"),
        .init(
          id: 222, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "existentials",
          color: "2211bb44", isDefault: true, description: "description"),
        .init(
          id: 333, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "existential member accesses", color: "9211bb44", isDefault: true,
          description: "description"),
        .init(
          id: 444, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "inout parameters", color: "22114b44", isDefault: true, description: "description"),
        .init(
          id: 555, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "variadic generics", color: "2499bb94", isDefault: true, description: "description"),
        .init(
          id: 666, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "multi-statement closures", color: "9911bb44", isDefault: true,
          description: "description"),
      ],
      state: .closed,
      locked: false,
      assignee: .apple,
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
      closedBy: .apple,
      repository: .swift
    )
  }
}

extension PerformGitHubApp {
  static var sample: PerformGitHubApp {
    PerformGitHubApp(
      id: Int.random(in: Int.min...Int.max),
      slug: "slug",
      nodeID: "nodeID",
      owner: .apple,
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

extension Label {
  static var sample: Label {
    Label(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      url: URL(string: "https://github.com")!,
      name: "name",
      color: "11334455",
      isDefault: true,
      description: "description"
    )
  }
}

extension Pull {
  static var sample: Pull {
    Pull(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      number: 132,
      state: .open,
      locked: false,
      title: "Title",
      user: .sample,
      body: "body",
      createdAt: .now,
      updateAt: .now,
      closedAt: .now,
      url: URL(string: "https://github.com")!,
      htmlURL: URL(string: "https://github.com")!,
      diffURL: URL(string: "https://github.com")!,
      patchURL: URL(string: "https://github.com")!,
      issueURL: URL(string: "https://github.com")!,
      mergedAt: .now,
      mergeCommitSha: "mergeCommitSha",
      assignee: .sample,
      assignees: [.sample],
      requestedReviewers: [.sample],
      requestedTeams: [.sample],
      labels: [.sample],
      milestone: .sample,
      isDraft: false,
      commitsURL: URL(string: "https://github.com")!,
      reviewCommentsURL: URL(string: "https://github.com")!,
      reviewCommentURL: URL(string: "https://github.com")!,
      commentsURL: URL(string: "https://github.com")!,
      statusesURL: URL(string: "https://github.com")!,
      head: .apple,
      base: .apple,
      authorAssociation: .collaborator,
      autoMerge: .apple,
      activeLockReason: .offTopic
    )
  }
}

extension Comment {
  static var sample: Comment {
    Comment(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      url: URL(string: "https://github.com")!,
      body: "Type inference fails chaining call on the return value of @resultBuilder",
      bodyText: "Type inference fails chaining call on the return value of @resultBuilder",
      bodyHTML: "Type inference fails chaining call on the return value of @resultBuilder",
      htmlURL: URL(string: "https://github.com")!,
      user: .zunda,
      createdAt: .now,
      updatedAt: .now,
      issueURL: URL(string: "https://github.com")!,
      authorAssociation: .collaborator,
      reactions: .sample,
      performGitHubApp: .sample
    )
  }
}

extension Merge {
  static let apple = Merge(
    enabledBy: .apple,
    method: .merge,
    commitTitle: "title",
    commitMessage: "message"
  )
}

extension Branch {
  static let apple = Branch(
    label: "label",
    ref: "ref",
    sha: "sha",
    user: .apple,
    repository: .swift
  )
}

extension ParentTeam {
  static var sample: ParentTeam {
    ParentTeam(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      membersURL: URL(string: "https://github.com")!,
      name: "TeamName",
      description: "description",
      permission: .pull,
      privacy: .closed,
      notificationSetting: .enabled,
      htmlURL: URL(string: "https://github.com")!,
      repositoriesURL: URL(string: "https://github.com")!,
      slug: "slug",
      ldapDn: "ldapDn"
    )
  }
}

extension Team {
  static var sample: Team {
    Team(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      name: "TeamName",
      slug: "slug",
      description: "description",
      privacy: .closed,
      notificationSetting: .enabled,
      permission: .pull,
      url: URL(string: "https://github.com")!,
      htmlURL: URL(string: "https://github.com")!,
      membersURL: URL(string: "https://github.com")!,
      repositoriesURL: URL(string: "https://github.com")!,
      parent: .sample
    )
  }
}

extension SimplePull {
  static let sample = SimplePull(
    url: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    diffURL: URL(string: "https://github.com")!,
    patchURL: URL(string: "https://github.com")!,
    mergedAt: .now
  )
}

extension Milestone {
  static var sample: Milestone {
    Milestone(
      id: Int.random(in: Int.min...Int.max),
      nodeID: "nodeID",
      state: .closed,
      number: 42,
      title: "Titlw",
      description: "description",
      url: URL(string: "https://github.com")!,
      htmlURL: URL(string: "https://github.com")!,
      labelsURL: URL(string: "https://github.com")!,
      creator: .apple,
      openIssueCount: 312,
      closedIssueCount: 3,
      createdAt: .now,
      updatedAt: .now,
      closedAt: .now,
      dueOn: .now
    )
  }
}
