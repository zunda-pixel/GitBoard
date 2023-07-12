//
//  RepositoriesView.swift
//

import SwiftUI
import GitHubKit

struct RepositoriesView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  @State var page = 1
  @State var _repositories: [Repository] = []
  
  var repositories: [Repository] {
    self._repositories.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.pushedAt, order: .reverse))
  }
  
  let userID: String
  
  func populateMoreRepositories(repositoryID: Repository.ID) async {
    guard repositoryID == repositories.last?.id else { return }
    page += 1
    do {
      let newRepositories = try await GitHubKit().repositories(
        userID: userID,
        type: .all,
        sort: .pushed,
        direction: .desc,
        perPage: 30,
        page: page
      )
      
      _repositories.append(contentsOf: newRepositories)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populateRepositories() async {
    page = 1
    
    do {
      _repositories = try await GitHubKit().repositories(
        userID: userID,
        type: .all,
        sort: .pushed,
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
      ForEach(repositories) { repository in
        RepositoryCell(repository: repository)
          .listRow()
          .task {
            await populateMoreRepositories(repositoryID: repository.id)
          }
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: repository))
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
