//
//  RepositoriesView.swift
//

import SwiftUI
import GitHubKit

struct RepositoriesView<ViewState: RepositoriesViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  @State var viewState: ViewState

  func populate() async {
    do {
      try await viewState.populateRepositories()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populateMore(id: Repository.ID) async {
    do {
      try await viewState.populateMoreRepositories(repositoryID: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(viewState.repositories) { repository in
        RepositoryCell(repository: repository)
          .listRow()
          .task {
            await populateMore(id: repository.id)
          }
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: repository))
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
private final class TestRepositoriesViewState: RepositoriesViewState {
  var page: Int = 0
  
  var _repositories: [Repository] = []
  
  func populateMoreRepositories(repositoryID: Repository.ID) async throws {
    _repositories = [
      .sample,
    ]
  }
  
  func populateRepositories() async throws {
    _repositories = [
      .sample,
    ]
  }
}

#Preview {
  RepositoriesView(viewState: TestRepositoriesViewState())
}
