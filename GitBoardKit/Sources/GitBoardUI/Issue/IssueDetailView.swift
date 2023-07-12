//
//  IssueDetailView.swift
//

import SwiftUI
import GitHubKit

struct IssueDetailView: View {
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
    VStack(alignment: .leading, spacing: 5) {
      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(avatarURL: repository.owner.avatarURL, type: repository.owner.type)
          .frame(width: 30, height: 30)
        
        Text("\(repository.owner.userID) / \(repository.name)")
        
        Text("#\(issue.number)")
          .foregroundStyle(.secondary)
      }
      
      Text(issue.title)
        .bold()
      
      stateLabelView
        .bold()
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


struct IssueDetailView_Preview: PreviewProvider {
  static var previews: some View {
    IssueDetailView(issue: .sample, repository: .sample)
  }
}
