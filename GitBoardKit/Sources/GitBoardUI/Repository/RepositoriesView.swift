//
//  RepositoriesView.swift
//

import SwiftUI
import GitHubKit

struct RepositoriesView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @State var loadPage = 1
  @State var repositories: [Repository] = []
  
  let userID: String
  
  func populateMoreRepositories(repositoryID: Repository.ID) async {
    guard repositoryID == repositories.last?.id else { return }
    loadPage += 1
    do {
      var newRepositories = try await GitHubKit().repositories(
        userID: userID,
        type: .all,
        sort: .pushed,
        direction: .desc,
        perPage: 30,
        page: loadPage
      )
      
      newRepositories.append(contentsOf: repositories)
      
      self.repositories = newRepositories.lazy
        .uniqued(keyPath: \.id)
        .sorted(using: KeyPathComparator(\.pushedAt))
        .reversed()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populateRepositories() async {
    do {
      repositories = try await GitHubKit().repositories(
        userID: userID,
        type: .all,
        sort: .pushed,
        direction: .desc,
        perPage: 30,
        page: 1
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(repositories) { repository in
        RepositoryCell(repository: repository)
          .frame(maxWidth: .infinity, alignment: .leading)
          .contentShape(.rect)
          .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
          .task {
            await populateMoreRepositories(repositoryID: repository.id)
          }
      }
    }
    .listStyle(.inset)
    .refreshable {
      await populateRepositories()
    }
    .task {
      await populateRepositories()
    }
  }
}

#Preview {
  RepositoriesView(userID: "apple")
    .environment(ErrorHandle())
}
