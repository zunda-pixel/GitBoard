//
//  SearchRepositoriesView.swift
//

import SwiftUI
import GitHubKit

struct SearchRepositoriesView: View {
  @Environment(ErrorHandle.self) var errorHandle

  @State var query = ""
  @State var repositories: [Repository] = []
  
  func searchRepositories() async {
    do {
      let response = try await GitHubKit().searchRepositories(query: query)
      repositories = response.repositories
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(repositories) { repository in
        RepositoryCell(repository: repository)
      }
    }
    .overlay {
      if repositories.isEmpty && !query.isEmpty {
        ContentUnavailableView.search(text: query)
      }
    }
    .searchable(text: $query)
    .onSubmit(of: .search) {
      Task {
        await searchRepositories()
      }
    }
  }
}

