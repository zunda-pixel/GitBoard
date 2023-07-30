//
//  IssueDetailView.swift
//

import GitHubAPI
import SwiftUI

struct IssueDetailView: View {
  @Environment(NavigationRouter.self) var router
  
  let issue: Issue
  let repository: Repository

  var stateLabel: (String, String, Color) {
    let hasPullRequest = issue.pullRequest != nil

    switch issue.state {
    case .open:
      return ("Open", "dot.circle", .green)
    case .closed:
      if hasPullRequest {
        return ("Closed", "checkmark.circle", .purple)
      } else {
        return ("Closed", "slash.circle", .secondary)
      }
    }
  }

  @ViewBuilder
  var stateLabelView: some View {
    Label(stateLabel.0, systemImage: stateLabel.1)
      .foregroundStyle(stateLabel.2)
      .padding(6)
      .overlay {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .foregroundStyle(stateLabel.2.opacity(0.1))
      }
  }

  var header: some View {
    VStack(alignment: .leading, spacing: 15) {
      HStack(alignment: .center, spacing: 15) {
        UserProfileImage(
          avatarURL: repository.owner!.avatarURL,
          type: repository.owner!.type
        )
          .frame(width: 30, height: 30)
          .onTapGesture {
            router.items.append(.userDetail(user: repository.owner!))
          }

        Text("\(repository.owner!.userID) / \(repository.name)")

        Text("#\(issue.number)")
          .foregroundStyle(.secondary)
      }
      .contentShape(.rect)
      .onTapGesture {
        router.items.append(.repositoryDetail(repository: repository))
      }

      Text(issue.title)
        .bold()

      stateLabelView
        .bold()
        .font(.caption)
    }
  }

  var body: some View {
    List {
      header
        .listRow()
        .listRowSeparator(.hidden)
    }
  }
}

#Preview{
  IssueDetailView(issue: .sample, repository: .swift)
}
