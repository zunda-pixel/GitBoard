//
//  Sample.swift
//

import Foundation
import GitHubAPI

extension Asset {
  static var sample: Asset {
    Asset(
      id: .init(Int.random(in: Int.min...Int.max)),
      nodeID: "nodeID",
      label: "label",
      state: .open,
      name: "name",
      url: URL(string: "https://github.com")!,
      browserDownloadURL: URL(string: "https://github.com")!,
      contentType: "zip",
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
      id: .init(Int.random(in: Int.min...Int.max)),
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
        .sample,
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
      id: .init(Int.random(in: Int.min...Int.max)),
      userID: "apple",
      userName: "apple",
      nodeID: "fadsfakjlk",
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
  static let sample = Repository(
    id: 321312,
    nodeID: "",
    name: "swift",
    fullName: "apple/swift",
    isPrivate: false,
    owner: .apple,
    organization: .apple,
    htmlURL: URL(string: "https://github.com")!,
    _description: "Swift",
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
      repository: .sample,
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
      id: .init(Int.random(in: Int.min...Int.max)),
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
          color: "ff11bb", isDefault: true, _description: "description"),
        .init(
          id: 222, nodeID: "nodeID", url: URL(string: "https://github.com")!, name: "existentials",
          color: "2211bb44", isDefault: true, _description: "description"),
        .init(
          id: 333, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "existential member accesses", color: "9211bb44", isDefault: true,
          _description: "description"),
        .init(
          id: 444, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "inout parameters", color: "22114b44", isDefault: true, _description: "description"),
        .init(
          id: 555, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "variadic generics", color: "2499bb94", isDefault: true, _description: "description"),
        .init(
          id: 666, nodeID: "nodeID", url: URL(string: "https://github.com")!,
          name: "multi-statement closures", color: "9911bb44", isDefault: true,
          _description: "description"),
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
      repository: .sample
    )
  }
}

extension PerformGitHubApp {
  static var sample: PerformGitHubApp {
    PerformGitHubApp(
      id: .init(Int.random(in: Int.min...Int.max)),
      slug: "slug",
      nodeID: "nodeID",
      owner: .apple,
      name: "name",
      _description: "description",
      externalURL: URL(string: "https://github.com")!,
      htmlURL: URL(string: "https://github.com")!,
      createdAt: .now,
      updatedAt: .now,
      permissions: .init(admin: true, maintain: false, push: true, triage: true, pull: true, issues: "write", metadata: "read"),
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
      id: .init(Int.random(in: Int.min...Int.max)),
      nodeID: "nodeID",
      url: URL(string: "https://github.com")!,
      name: "name",
      color: "11334455",
      isDefault: true,
      _description: "description"
    )
  }
}

extension PullRequest {
  static var sample: PullRequest {
    PullRequest(
      id: .init(Int.random(in: Int.min...Int.max)),
      nodeID: "nodeID",
      number: 132,
      state: .open,
      locked: false,
      title: "Use index.md instead of [topic_name].md",
      user: .sample,
      body:
        "This branch does two things:\r\n\r\n- Renames each topic\'s Markdown file to be the standard index.md, so we can see its contents as soon as you click into the topic folder in the GitHub UI.\r\n- Updates the content to be the latest from our master sheet.\r\n\r\n/cc @github/identity-team-rainbow-skate @nayafia",
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
      assignees: [
        .sample
      ],
      requestedReviewers: [
        .sample
      ],
      requestedTeams: [
        .sample
      ],
      labels: [
        .sample
      ],
      milestone: .sample,
      isDraft: false,
      commitsURL: URL(string: "https://github.com")!,
      reviewCommentsURL: URL(string: "https://github.com")!,
      reviewCommentURL: URL(string: "https://github.com")!,
      commentsURL: URL(string: "https://github.com")!,
      statusesURL: URL(string: "https://github.com")!,
      head: .sample,
      base: .sample,
      authorAssociation: .collaborator,
      autoMerge: .sample,
      activeLockReason: .offTopic
    )
  }
}

extension Issue.Comment {
  static var sample: Issue.Comment {
    Issue.Comment(
      id: .init(Int.random(in: Int.min...Int.max)),
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

extension AutoMerge {
  static let sample = AutoMerge(
    enabledBy: .sample,
    method: .merge,
    commitTitle: "Merge pull request #27 from zunda-pixel/develop/fix-decode",
    commitMessage: "Develop/fix decode"
  )
}

extension Branch {
  static let sample = Branch(
    label: "zunda-pixel:main",
    ref: "main",
    sha: "13a5ec49c9fadd49761f9113134cb29a2163f9fb",
    user: .sample,
    repository: .sample
  )
}

extension ParentTeam {
  static var sample: ParentTeam {
    ParentTeam(
      id: .init(Int.random(in: Int.min...Int.max)),
      nodeID: "nodeID",
      membersURL: URL(string: "https://github.com")!,
      name: "TeamName",
      _description: "description",
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
      id: .init(Int.random(in: Int.min...Int.max)),
      nodeID: "nodeID",
      name: "TeamName",
      slug: "slug",
      _description: "description",
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

extension SimplePullRequest {
  static let sample = SimplePullRequest(
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
      id: .init(Int.random(in: Int.min...Int.max)),
      nodeID: "nodeID",
      state: .closed,
      number: 42,
      title: "backlog",
      _description: "",
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
}

extension Discussion.User {
  static let sample = Discussion.User(
    login: "zunda-pixel",
    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/47569369?v=4")!,
    resourcePath: "/zunda-pixel",
    url: URL(string: "https://github.com/zunda-pixel")!
  )
}

extension Discussion.Comment {
  static var sample = Discussion.Comment(
    id: "\(Int.random(in: Int.min...Int.max))",
    author: .sample,
    body: """
      <p>There isn’t an API that summarizes why a PR is mergeable or not, only that it is or isn’t. In <a href=\"https://developer.github.com/v3/pulls/#get-a-single-pull-request\" rel=\"nofollow noopener\">the documentation</a> it states:</p>\n<blockquote>\n<p>The value of the <code>mergeable</code> attribute can be <code>true</code>, <code>false</code>, or <code>null</code>. If the value is <code>null</code>, this means that the mergeability hasn’t been computed yet, and a background job was started to compute it. Give the job a few moments to complete, and then submit the request again. When the job is complete, the response will include a non-<code>null</code> value for the <code>mergeable</code> attribute.</p>\n</blockquote>\n<p>We don’t record the result of why, only yes, no, or not yet computed.</p>\n<p>I hope that helps :+1:</p>
      """,
    bodyHTML: """
      <p dir=\"auto\">There isn’t an API that summarizes why a PR is mergeable or not, only that it is or isn’t. In <a href=\"https://developer.github.com/v3/pulls/#get-a-single-pull-request\">the documentation</a> it states:</p>\n<blockquote>\n<p dir=\"auto\">The value of the <code class=\"notranslate\">mergeable</code> attribute can be <code class=\"notranslate\">true</code>, <code class=\"notranslate\">false</code>, or <code class=\"notranslate\">null</code>. If the value is <code class=\"notranslate\">null</code>, this means that the mergeability hasn’t been computed yet, and a background job was started to compute it. Give the job a few moments to complete, and then submit the request again. When the job is complete, the response will include a non-<code class=\"notranslate\">null</code> value for the <code class=\"notranslate\">mergeable</code> attribute.</p>\n</blockquote>\n<p dir=\"auto\">We don’t record the result of why, only yes, no, or not yet computed.</p>\n<p dir=\"auto\">I hope that helps <g-emoji class=\"g-emoji\" alias=\"+1\" fallback-src=\"https://github.githubassets.com/images/icons/emoji/unicode/1f44d.png\">👍</g-emoji></p>"
      - bodyText : "There isn’t an API that summarizes why a PR is mergeable or not, only that it is or isn’t. In the documentation it states:\n\nThe value of the mergeable attribute can be true, false, or null. If the value is null, this means that the mergeability hasn’t been computed yet, and a background job was started to compute it. Give the job a few moments to complete, and then submit the request again. When the job is complete, the response will include a non-null value for the mergeable attribute.\n\nWe don’t record the result of why, only yes, no, or not yet computed.\nI hope that helps 👍
      """,
    bodyText:
      "There isn’t an API that summarizes why a PR is mergeable or not, only that it is or isn’t. In the documentation it states:\n\nThe value of the mergeable attribute can be true, false, or null. If the value is null, this means that the mergeability hasn’t been computed yet, and a background job was started to compute it. Give the job a few moments to complete, and then submit the request again. When the job is complete, the response will include a non-null value for the mergeable attribute.\n\nWe don’t record the result of why, only yes, no, or not yet computed.\nI hope that helps 👍",
    createdAt: .now,
    createdViaEmail: false,
    editor: .sample,
    authorAssociation: .mannequin,
    includesCreatedEdit: false,
    lastEditedAt: .now,
    publishedAt: .now,
    updatedAt: .now,
    viewerDidAuthor: false
  )
}

extension Discussion {
  static var sample = Discussion(
    id: .init(UUID().uuidString),
    number: Int.random(in: Int.min...Int.max),
    url: URL(string: "https://githubc.com")!,
    author: .sample,
    createdAt: .now,
    title: "API - Getting the reason that a pull request isn\'t mergeable?",
    updatedAt: .now,
    upvoteCount: 13,
    stateReason: .duplicate,
    activeLockReason: .offTopic,
    authorAssociation: .contributor,
    body: """
      <p>I can use the <a href=\"https://developer.github.com/v3/pulls/\" rel=\"nofollow noopener\">pull requests</a> api to see whether a PR is mergeable, and I can use the <a href=\"https://developer.github.com/v3/repos/statuses/\" rel=\"nofollow noopener\">status api</a> to check custom statuses logged for a given commit, but how can I fetch the reason that a PR is blocked from merging (e.g. it could be merge conflicts, review obligations, commit status)?</p>
      """,
    bodyHTML: """
      <p dir=\"auto\">I can use the <a href=\"https://developer.github.com/v3/pulls/\">pull requests</a> api to see whether a PR is mergeable, and I can use the <a href=\"https://developer.github.com/v3/repos/statuses/\">status api</a> to check custom statuses logged for a given commit, but how can I fetch the reason that a PR is blocked from merging (e.g. it could be merge conflicts, review obligations, commit status)?</p>
      """,
    bodyText:
      "I can use the pull requests api to see whether a PR is mergeable, and I can use the status api to check custom statuses logged for a given commit, but how can I fetch the reason that a PR is blocked from merging (e.g. it could be merge conflicts, review obligations, commit status)?",
    createdViaEmail: true,
    databaseId: Int.random(in: Int.min...Int.max),
    editor: .sample,
    includesCreatedEdit: true,
    lastEditedAt: .now,
    locked: false,
    viewerCanClose: true,
    viewerCanDelete: true,
    viewerCanReact: true,
    viewerCanReopen: true,
    viewerCanSubscribe: true,
    viewerCanUpdate: true,
    viewerCanUpvote: true,
    viewerDidAuthor: true,
    viewerHasUpvoted: true,
    viewerSubscription: .subscribed,
    category: .sample,
    labels: [
      .sample
    ],
    reactions: [
      .sample
    ],
    poll: .sample,
    commentsCount: 12
  )
}

extension Discussion.Reaction {
  static let sample = Discussion.Reaction(
    content: "content",
    createdAt: .now,
    databaseId: Int.random(in: Int.min...Int.max),
    user: .sample
  )
}

extension Discussion.Label {
  static let sample = Discussion.Label(
    name: "API and Webhooks",
    color: "e0023d",
    createdAt: .now,
    _description: "",
    isDefault: false,
    resourcePath: "/community/community/labels/API%20and%20Webhooks",
    updatedAt: .now,
    url: URL(string: "https://github.com")!
  )
}

extension Discussion.Poll {
  static let sample = Discussion.Poll(
    question: "question",
    totalVoteCount: 123,
    viewerCanVote: true,
    viewerHasVoted: true,
    options: [
      .init(option: "Option1", totalVoteCount: 2, viewerHasVoted: true),
      .init(option: "Option2", totalVoteCount: 5, viewerHasVoted: true),
      .init(option: "Option3", totalVoteCount: 1, viewerHasVoted: true),
    ]
  )
}

extension GitHubData.Category {
  static let sample = Category(
    createdAt: .now,
    _description:
      "Conversations related to getting started on using GitHub and the community. For beginners of GitHub, Community on Discussions, and those new to different areas of the product alike!",
    emoji: ":new:",
    emojiHTML: """
      <div><g-emoji class=\"g-emoji\" alias=\"new\" fallback-src=\"https://github.githubassets.com/images/icons/emoji/unicode/1f195.png\">🆕</g-emoji></div>
      """,
    isAnswerable: false,
    name: "New to GitHub",
    slug: "new-to-github",
    updateAt: .now
  )
}
