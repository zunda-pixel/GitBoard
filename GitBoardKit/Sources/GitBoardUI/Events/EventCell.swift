//
//  EventCell.swift
//

import SwiftUI
import GitHubData

struct EventCell: View {
  let event: Event

  var body: some View {
    switch event.payload {
    case .push(_, _, _, _, _,_, _, _):
      fatalError()
    case let .pullRequest(action, number, pullRequest):
      EventPullRequestCell(
        action: action,
        number: number,
        pullRequest: pullRequest
      )
    case .create(_, _, _, _, _):
      fatalError()
    case let .issueComment(action, issue, comment):
      EventIssueCommentCell(
        action: action,
        issue: issue,
        comment: comment
      )
    case let .issue(action, issue):
      EventIssueCell(
        action: action,
        issue: issue
      )
    case .watch(_):
      fatalError()
    case let .fork(repository):
      EventForkCell(repository: repository)
    case .delete(_, _, _):
      fatalError()
    case .gollum(_):
      fatalError()
    case let .pullRequestReview(action, review, pullRequest):
      EventPullRequestReviewCell(
        action: action,
        review: review,
        pullRequest: pullRequest
      )
    case let .pullRequestReviewComment(action, comment, pullRequest):
      EventPullRequestReviewCommentCell(
        action: action,
        comment: comment,
        pullRequest: pullRequest
      )
    case let .release(action, release):
      EventReleaseCell(
        action: action,
        release: release
      )
    case let .commitComment(comment):
      EventCommitCommentCell(comment: comment)
    case .publicEvent:
      fatalError()
    case .member(_, _):
      fatalError()
    }
  }
}
