//
//  PullCell.swift
//

import GitHubAPI
import SwiftUI

struct PullRequestCell: View {
  let pullRequest: PullRequest

  @ViewBuilder
  var stateView: some View {
    switch pullRequest.state {
    case .open:
      Image(systemName: "arrow.triangle.swap")
        .foregroundStyle(.green)
    case .closed:
      if pullRequest.mergedAt != nil {
        Image(systemName: "arrow.triangle.merge")
          .foregroundStyle(.purple)
      } else {
        Image(systemName: "arrow.triangle.pull")
          .foregroundStyle(.red)
      }
    }
  }

  var label: LocalizedStringKey {
    switch pullRequest.state {
    case .open:
      "#\(pullRequest.number) opened \(pullRequest.createdAt, format: .relative(presentation: .named)) by \(pullRequest.user.userID)"
    case .closed:
      if let mergedAt = pullRequest.mergedAt {
        "#\(pullRequest.number) by \(pullRequest.user.userID) was merged \(mergedAt, format: .relative(presentation: .named))"
      } else if let closedAt = pullRequest.closedAt {
        "#\(pullRequest.number) by \(pullRequest.user.userID) was closed \(closedAt, format: .relative(presentation: .named))"
      } else {
        fatalError()
      }
    }
  }

  var body: some View {
    Label {
      VStack(alignment: .leading, spacing: 5) {
        Text(pullRequest.title)
          .bold()
        FlowLayout(alignment: .center, spacing: 10) {
          ForEach(pullRequest.labels) { label in
            LabelCell(label: label)
          }
        }
        .font(.caption)

        Text(label)
          .foregroundStyle(.secondary)
          .font(.caption)
      }
    } icon: {
      stateView
    }
  }
}

#Preview{
  PullRequestCell(pullRequest: .sample)
}
