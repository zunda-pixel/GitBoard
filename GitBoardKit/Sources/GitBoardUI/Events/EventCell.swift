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
    case .pullRequest(let action, let number, let pullRequest):
      EventPullRequestCell(
        action: action,
        number: number,
        pullRequest: pullRequest
      )
    case .create(_, _, _, _, _):
      fatalError()
    case .issueComment(let action, let issue, let comment):
      EventIssueCommentCell(
        action: action,
        issue: issue,
        comment: comment
      )
    case .issue(let action, let issue):
      EventIssueCell(
        action: action,
        issue: issue
      )
    case .watch(_):
      fatalError()
    case .fork(let repository):
      EventForkCell(repository: repository)
    case .delete(_, _, _):
      fatalError()
    case .gollum(_):
      fatalError()
    case .pullRequestReview(let action, let review, let pull):
      EventPullRequestReviewCell(
        action: action,
        review: review,
        pull: pull
      )
    case .pullRequestReviewComment(let action, let comment, let pull):
      EventPullRequestReviewCommentCell(
        action: action,
        comment: comment,
        pull: pull
      )
    case .release(let action, let release):
      EventReleaseCell(
        action: action,
        release: release
      )
    case .commitComment(let comment):
      EventCommitCommentCell(comment: comment)
    case .publicEvent:
      fatalError()
    case .member(_, _):
      fatalError()
    }
  }
}
