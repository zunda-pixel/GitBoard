//
//  Discussion.swift
//

import Foundation
import GitHubData
import SwiftData

@Model
final public class Discussion {
  @Attribute(.unique)
  public var discussionID: String
  public var number: Int
  public var repositoryID: Repository.ID
  public var url: URL
  public var author: GitHubData.Discussion.User?
  public var createdAt: Date
  public var title: String
  public var updatedAt: Date
  public var upvoteCount: Int
  public var stateReason: GitHubData.Discussion.StateReason?
  public var activeLockReason: GitHubData.ActiveLockReason?
  public var authorAssociation: GitHubData.AuthorAssociation
  public var body: String
  public var bodyHTML: String
  public var bodyText: String
  public var createdViaEmail: Bool
  public var databaseId: Int
  public var editor: GitHubData.Discussion.User?
  public var includesCreatedEdit: Bool
  public var lastEditedAt: Date?
  public var locked: Bool
  public var viewerCanClose: Bool
  public var viewerCanDelete: Bool
  public var viewerCanReact: Bool
  public var viewerCanReopen: Bool
  public var viewerCanSubscribe: Bool
  public var viewerCanUpdate: Bool
  public var viewerCanUpvote: Bool
  public var viewerDidAuthor: Bool
  public var viewerHasUpvoted: Bool
  public var viewerSubscription: GitHubData.SubscriptionState
  public var commentsCount: Int
  public var comments: [GitHubData.Discussion.Comment]
  public var category: GitHubData.Category
  public var labels: [GitHubData.Discussion.Label]
  public var reactions: [GitHubData.Discussion.Reaction]
  public var poll: GitHubData.Discussion.Poll?

  public init(
    discussionID: String,
    number: Int,
    repositoryID: Repository.ID,
    url: URL,
    author: GitHubData.Discussion.User?,
    createdAt: Date,
    title: String,
    updatedAt: Date,
    upvoteCount: Int,
    stateReason: GitHubData.Discussion.StateReason?,
    activeLockReason: GitHubData.ActiveLockReason?,
    authorAssociation: GitHubData.AuthorAssociation,
    body: String,
    bodyHTML: String,
    bodyText: String,
    createdViaEmail: Bool,
    databaseId: Int,
    editor: GitHubData.Discussion.User?,
    includesCreatedEdit: Bool,
    lastEditedAt: Date?,
    locked: Bool,
    viewerCanClose: Bool,
    viewerCanDelete: Bool,
    viewerCanReact: Bool,
    viewerCanReopen: Bool,
    viewerCanSubscribe: Bool,
    viewerCanUpdate: Bool,
    viewerCanUpvote: Bool,
    viewerDidAuthor: Bool,
    viewerHasUpvoted: Bool,
    viewerSubscription: GitHubData.SubscriptionState,
    commentsCount: Int,
    comments: [GitHubData.Discussion.Comment],
    category: GitHubData.Category,
    labels: [GitHubData.Discussion.Label],
    reactions: [GitHubData.Discussion.Reaction],
    poll: GitHubData.Discussion.Poll?
  ) {
    self.discussionID = discussionID
    self.number = number
    self.repositoryID = repositoryID
    self.url = url
    self.author = author
    self.createdAt = createdAt
    self.title = title
    self.updatedAt = updatedAt
    self.upvoteCount = upvoteCount
    self.stateReason = stateReason
    self.activeLockReason = activeLockReason
    self.authorAssociation = authorAssociation
    self.body = body
    self.bodyHTML = bodyHTML
    self.bodyText = bodyText
    self.createdViaEmail = createdViaEmail
    self.databaseId = databaseId
    self.editor = editor
    self.includesCreatedEdit = includesCreatedEdit
    self.lastEditedAt = lastEditedAt
    self.locked = locked
    self.viewerCanClose = viewerCanClose
    self.viewerCanDelete = viewerCanDelete
    self.viewerCanReact = viewerCanReact
    self.viewerCanReopen = viewerCanReopen
    self.viewerCanSubscribe = viewerCanSubscribe
    self.viewerCanUpdate = viewerCanUpdate
    self.viewerCanUpvote = viewerCanUpvote
    self.viewerDidAuthor = viewerDidAuthor
    self.viewerHasUpvoted = viewerHasUpvoted
    self.viewerSubscription = viewerSubscription
    self.commentsCount = commentsCount
    self.comments = comments
    self.category = category
    self.labels = labels
    self.reactions = reactions
    self.poll = poll
  }

  public init(discussion: GitHubData.Discussion, repositoryID: Repository.ID) {
    self.discussionID = discussion.id.rawValue
    self.number = discussion.number
    self.repositoryID = repositoryID
    self.url = discussion.url
    self.author = discussion.author
    self.createdAt = discussion.createdAt
    self.title = discussion.title
    self.updatedAt = discussion.updatedAt
    self.upvoteCount = discussion.upvoteCount
    self.stateReason = discussion.stateReason
    self.activeLockReason = discussion.activeLockReason
    self.authorAssociation = discussion.authorAssociation
    self.body = discussion.body
    self.bodyHTML = discussion.bodyHTML
    self.bodyText = discussion.bodyText
    self.createdViaEmail = discussion.createdViaEmail
    self.databaseId = discussion.databaseId
    self.editor = discussion.editor
    self.includesCreatedEdit = discussion.includesCreatedEdit
    self.lastEditedAt = discussion.lastEditedAt
    self.locked = discussion.locked
    self.viewerCanClose = discussion.viewerCanClose
    self.viewerCanDelete = discussion.viewerCanDelete
    self.viewerCanReact = discussion.viewerCanReact
    self.viewerCanReopen = discussion.viewerCanReopen
    self.viewerCanSubscribe = discussion.viewerCanSubscribe
    self.viewerCanUpdate = discussion.viewerCanUpdate
    self.viewerCanUpvote = discussion.viewerCanUpvote
    self.viewerDidAuthor = discussion.viewerDidAuthor
    self.viewerHasUpvoted = discussion.viewerHasUpvoted
    self.viewerSubscription = discussion.viewerSubscription
    self.commentsCount = discussion.commentsCount
    self.comments = []
    self.category = discussion.category
    self.labels = discussion.labels
    self.reactions = discussion.reactions
    self.poll = discussion.poll
  }
}

extension GitBoardData.Discussion: DiscussionProtocol {

}

extension GitHubData.Discussion: DiscussionProtocol {

}

extension GitHubData.Category: CategoryProtocol {

}
