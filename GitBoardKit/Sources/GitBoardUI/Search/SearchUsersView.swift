//
//  SearchUsersView.swift
//

import GitBoardData
import GitHubAPI
import SwiftData
import SwiftUI

struct SearchUsersView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(\.modelContext) var modelContext
  @Query var users: [GitBoardData.User]
  let query: String
  @State var page = 1

  init(query: String) {
    self.query = query
    let predicate: Predicate<GitBoardData.User> = #Predicate{
      $0.userID.contains(query) || $0.userName?.contains(query) ?? false
    }
    self._users = .init(
      filter: predicate,
      sort: [
        .init(\.userID),
        .init(\.userName),
      ]
    )
  }

  @MainActor
  func populate() async throws {
    let response = try await GitHubAPI().searchUsers(
      query: query,
      perPage: 30,
      page: page
    )

    for user in response.users {
      let predicate: Predicate<GitBoardData.User> = #Predicate{
        $0.githubID == user.id
      }

      var descriptor: FetchDescriptor<GitBoardData.User> = .init(predicate: predicate)
      descriptor.fetchLimit = 1

      if let foundUser = try modelContext.fetch(descriptor).first {
        foundUser.update(user: user)
      } else {
        let newUser = GitBoardData.User.from(user: user)
        modelContext.insert(newUser)
      }
    }
  }

  @MainActor
  func populateUsers() async {
    page = 1

    do {
      try await populate()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  @MainActor
  func populateMoreUsers(id: GitBoardData.User.ID) async {
    guard id == users.last?.id else { return }
    page += 1

    do {
      try await populate()
    } catch {
      page -= 1
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(users) { user in
        NavigationLink {
          UserDetailView(user: user)
        } label: {
          UserCell(user: user)
        }
        .task {
          await populateMoreUsers(id: user.id)
        }
      }
    }
    .listStyle(.plain)
    .task {
      await populateUsers()
    }
  }
}
