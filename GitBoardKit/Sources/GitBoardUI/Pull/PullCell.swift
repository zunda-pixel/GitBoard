//
//  PullCell.swift
//

import GitHubKit
import SwiftUI

struct PullCell: View {
  let pull: Pull

  @ViewBuilder
  var stateView: some View {
    switch pull.state {
    case .open:
      Image(systemName: "arrow.triangle.swap")
        .foregroundStyle(.green)
    case .closed:
      if pull.mergedAt != nil {
        Image(systemName: "arrow.triangle.merge")
          .foregroundStyle(.purple)
      } else {
        Image(systemName: "arrow.triangle.pull")
          .foregroundStyle(.red)
      }
    }
  }

  var label: LocalizedStringKey {
    switch pull.state {
    case .open:
      "#\(pull.number) opened \(pull.createdAt, format: .relative(presentation: .named)) by \(pull.user.userID)"
    case .closed:
      if let mergedAt = pull.mergedAt {
        "#\(pull.number) by \(pull.user.userID) was merged \(mergedAt, format: .relative(presentation: .named))"
      } else if let closedAt = pull.closedAt {
        "#\(pull.number) by \(pull.user.userID) was closed \(closedAt, format: .relative(presentation: .named))"
      } else {
        fatalError()
      }
    }
  }

  var body: some View {
    Label {
      VStack(alignment: .leading, spacing: 5) {
        Text(pull.title)
          .bold()
        FlowLayout(alignment: .center, spacing: 10) {
          ForEach(pull.labels) { label in
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
  PullCell(pull: .sample)
}
