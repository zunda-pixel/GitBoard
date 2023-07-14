//
//  IssuesView.swift
//

import SwiftUI
import GitHubKit

struct IssuesView: View {
  let ownerID: String
  let repository: Repository
  
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  
  @State var _issues: [Issue] = []
  var issues: [Issue] {
    self._issues.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.title, order: .reverse))
  }
  @State var page = 1
  
  func populateMoreIssues(issueID: Issue.ID) async {
    guard issueID == issues.last?.id else { return }
    page += 1
    
    do {
      let newIssues = try await GitHubKit().issues(
        ownerID: ownerID,
        repositoryName: repository.name,
        state: .all,
        sort: .created,
        direction: .desc,
        perPage: 30,
        page: page
      )
      
      _issues.append(contentsOf: newIssues)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populateIssues() async {
    page = 1
    
    do {
      _issues = try await GitHubKit().issues(
        ownerID: ownerID,
        repositoryName: repository.name,
        state: .all,
        sort: .created,
        direction: .desc,
        perPage: 30,
        page: page
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(issues) { issue in
        IssueCell(issue: issue)
          .listRow()
          .onTapGesture {
            router.items.append(.issueDetail(issue: issue, repository: repository))
          }
          .task {
            await populateMoreIssues(issueID: issue.id)
          }
      }
    }
    .listStyle(.plain)
    .refreshable {
      await populateIssues()
    }
    .task {
      await populateIssues()
    }
  }
}


#Preview {
  NavigationStack {
    IssuesView(ownerID: "apple", repository: .sample)
      .environment(ErrorHandle())
  }
  .frame(maxWidth: 500)
}

private extension IssueSearchState {
  var label: String {
    switch self {
    case .all: "All"
    case .closed: "Closed"
    case .open: "Open"
    }
  }
}
