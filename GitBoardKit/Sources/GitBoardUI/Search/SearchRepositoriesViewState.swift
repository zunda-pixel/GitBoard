//
//  SearchRepositoriesViewState.swift
//

import GitHubKit
import SwiftUI

@Observable
final class SearchRepositoriesViewState: RepositoriesViewState {
  let query: String
  var page: Int = 1
  var _repositories: [Repository] = []

  init(query: String) {
    self.query = query
  }

  func populateMoreRepositories(id: Repository.ID) async throws {
    guard id == repositories.last?.id else { return }
    page += 1

    let response = try await GitHubAPI().searchRepositories(
      query: query,
      sort: nil,
      order: .desc,
      perPage: 30,
      page: page
    )

    _repositories.append(contentsOf: response.repositories)
  }

  func populateRepositories() async throws {
    page = 1

    let response = try await GitHubAPI().searchRepositories(
      query: query,
      sort: nil,
      order: .desc,
      perPage: 30,
      page: page
    )

    _repositories = response.repositories
  }
}

#Preview{
  NavigationStack {
    let viewState = SearchRepositoriesViewState(query: "swift")
    RepositoriesView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
