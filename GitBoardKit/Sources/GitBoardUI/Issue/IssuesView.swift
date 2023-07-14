//
//  IssuesView.swift
//

import SwiftUI
import GitHubKit

struct IssuesView<ViewState: IssuesViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  
  @State var viewState: ViewState
  
  func populateMore(id: Issue.ID) async {
    do {
      try await viewState.populateMoreIssues(issueID: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populate() async {
    do {
      try await viewState.populateIssues()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(viewState.issues) { issue in
        IssueCell(issue: issue)
          .listRow()
          .onTapGesture {
            router.items.append(.issueDetail(issue: issue, repository: viewState.repository))
          }
          .task {
            await populateMore(id: issue.id)
          }
      }
    }
    .listStyle(.plain)
    .refreshable {
      await populate()
    }
    .task {
      await populate()
    }
  }
}

@Observable
final private class TestIssuesViewState: IssuesViewState {
  let ownerID: String
  let repository: Repository
  var _issues: [Issue] = []
  
  init(ownerID: String, repository: Repository) {
    self.ownerID = ownerID
    self.repository = repository
  }
  
  func populateMoreIssues(issueID: Issue.ID) async throws {
    _issues = [
      .sample
    ]
  }
  
  func populateIssues() async throws {
    _issues = [
      .sample
    ]
  }
}

#Preview {
  NavigationStack {
    let viewState = TestIssuesViewState(ownerID: "apple", repository: .sample)
    IssuesView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
  .frame(maxWidth: 500)
}
