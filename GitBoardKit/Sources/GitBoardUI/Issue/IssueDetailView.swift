//
//  IssueDetailView.swift
//

import GitHubAPI
import SwiftUI

struct IssueDetailView<ViewState: IssueDetailViewState>: View {
  @Environment(NavigationRouter.self) var router
  @Environment(ErrorHandle.self) var errorHandle
  
  @State var viewState: ViewState

  var stateLabel: (String, String, Color) {
    switch viewState.issue.state {
    case .open:
      return ("Open", "dot.circle", .green)
    case .closed:
      return ("Closed", "checkmark.circle", .purple)
    }
  }

  @ViewBuilder
  var stateLabelView: some View {
    Label(stateLabel.0, systemImage: stateLabel.1)
      .foregroundStyle(stateLabel.2)
      .padding(.vertical, 6)
      .padding(.horizontal, 15)
      .overlay {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .foregroundStyle(stateLabel.2.opacity(0.1))
      }
  }

  @MainActor
  var header: some View {
    VStack(alignment: .leading, spacing: 15) {
      HStack(alignment: .center, spacing: 15) {
        IconRepositoryUserName(
          owner: viewState.repository.owner!,
          repository: viewState.repository,
          imageSize: 30
        )

        Text("#\(viewState.issue.number)")
          .foregroundStyle(.secondary)
      }
      .contentShape(.rect)
      .onTapGesture {
        router.items.append(
          .repositoryDetail(
            repository: viewState.repository
          )
        )
      }

      Text(viewState.issue.title)
        .bold()

      stateLabelView
        .bold()
        .font(.caption)
    }
  }

  func populate() async {
    do {
      try await viewState.populateComments()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  func populateMore(id: Issue.Comment.ID) async {
    do {
      try await viewState.populateMoreComments(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  @ViewBuilder
  var comments: some View {
    ForEach(viewState.comments) { comment in
      VStack(alignment: .leading, spacing: 0) {
        CommentCell(comment: comment)
          .padding(10)
          .frame(maxWidth: .infinity, alignment: .leading)

        Divider()
      }
      .listRow()
      .task {
        await populateMore(id: comment.id)
      }
    }
  }
  
  var body: some View {
    List {
      VStack(alignment: .leading, spacing: 0) {
        header
          .padding(10)
          .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
      }
      .listRow()
      
      if let body = viewState.issue.body {
        VStack(alignment: .leading, spacing: 0) {
          MarkdownView(source: body)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
        .listRow()
      }
      
      comments
    }
    .listStyle(.plain)
    .task {
      await populate()
    }
    .refreshable {
      await populate()
    }
  }
}

#Preview {
  NavigationStack {
    let viewState = RepositoryIssueDetailViewState(
      issue: .swiftIssue,
      repository: .swift
    )
    IssueDetailView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}

private extension GitHubData.Issue {
  static let swiftIssue: GitHubData.Issue = .init(
    id: 123,
    number: 67815,
    title: "fail to build Observable extenion method on RxSwift",
    body: """
 **Description** in Xcode 15 beta 6,[RxSwiftExt](https://github.com/RxSwiftCommunity/RxSwiftExt) Package is starting to fail building. It turns out that specific method declaration extension is problematic.

 **Steps to reproduce**

 I made a simple example to reproduce. or you can try to build RxSwiftExt Package.

 ```swift
 import RxSwift

 extension Observable {
     func test() -> Observable<Bool> {
         // error: Cannot convert return expression of type 'Observable<Element>' to return type 'Observable<Bool>'
         // error: Cannot specialize non-generic type 'Observable<Element>'
         return Observable<Bool>.empty()
     }
 }
 ```

 but this two code is passing without error.

 ```swift
 // fully unqualified
 extension Observable {
     func test() -> Observable<Bool> {
         return .empty()
     }
 }

 // fully qualified
 extension Observable {
     func test() -> Observable<Bool> {
         return RxSwift.Observable<Bool>.empty()
     }
 }
 ```

 **Expected behavior**

 build success without error

 **Environment**

 * Swift compiler version info

 > swift-driver version: 1.87.1 Apple Swift version 5.9 (swiftlang-5.9.0.128.2 clang-1500.0.40.1)
 > Target: arm64-apple-macosx13.0

 * Xcode version info

 > Xcode 15.0
 > Build version 15A5219j

 * Deployment target: N/A
""",
    bodyHTML: nil,
    bodyText: nil,
    user: .apple,
    nodeID: "",
    url: .applicationDirectory,
    repositoryURL: .applicationDirectory,
    labelsURL: .applicationDirectory,
    commentsURL: .applicationDirectory,
    eventsURL: .applicationDirectory,
    htmlURL: .applicationDirectory,
    labels: [],
    state: .closed,
    locked: false,
    assignee: nil,
    assignees: [],
    milestone: nil,
    commentsCount: 123,
    createdAt: .now,
    updatedAt: .now,
    closedAt: nil,
    authorAssociation: .collaborator,
    activeLockReason: nil,
    draft: nil,
    pullRequest: nil,
    reactions: nil,
    timelineURL: nil,
    performedViaGitHubApp: nil,
    stateReason: nil,
    closedBy: nil,
    repository: .swift
  )
}

extension GitHubData.Repository {
  static let swift: GitHubData.Repository = .init(
    id: 123,
    nodeID: "",
    name: "swift",
    fullName: "swift",
    isPrivate: false,
    owner: .apple,
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
    mirrorURL: nil,
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
    starredAt: nil,
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
