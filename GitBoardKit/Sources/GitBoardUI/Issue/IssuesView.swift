//
//  IssuesView.swift
//

import GitHubAPI
import SwiftUI

struct IssuesView<ViewState: IssuesViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @EnvironmentObject var router: NavigationRouter

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
        VStack(alignment: .leading, spacing: 0) {
          IssueCell(issue: issue)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
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
      .sample,
      .sample,
      .sample,
    ]
  }

  func populateIssues() async throws {
    _issues = [
      .sample,
      .sample,
      .sample,
    ]
  }
}

#Preview{
  NavigationStack {
    let viewState = TestIssuesViewState(ownerID: "apple", repository: .sample)
    IssuesView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environmentObject(NavigationRouter())
  .frame(maxWidth: 500)
}
