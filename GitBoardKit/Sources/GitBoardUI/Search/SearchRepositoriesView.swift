//
//  SearchRepositoriesView.swift
//

import SwiftUI
import GitHubKit

struct SearchRepositoriesView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  
  let query: String
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
          .listRow()
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: repository))
          }
      }
    }
    .listStyle(.inset)
    .overlay {
      if repositories.isEmpty && !query.isEmpty {
        ContentUnavailableView.search(text: query)
      }
    }
    .task {
      await searchRepositories()
    }
    .refreshable {
      await searchRepositories()
    }
  }
}

#Preview {
  NavigationStack {
    SearchRepositoriesView(query: "swift")
  }
    .environment(ErrorHandle())
    .environment(NavigationRouter())
}
