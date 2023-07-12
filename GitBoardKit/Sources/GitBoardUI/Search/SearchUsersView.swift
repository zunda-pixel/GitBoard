//
//  SearchUsersView.swift
//

import SwiftUI
import GitHubKit
import Algorithms

struct SearchUsersView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  let query: String
  @State var users: [User] = []
  
  func searchUsers() async {
    do {
      let response = try await GitHubKit().searchUsers(query: query)
      users = response.users
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(users) { user in
        UserCell(user: user)
          .listRow()
          .onTapGesture {
            router.items.append(.userDetail(user: user))
          }
      }
    }
    .overlay {
      if users.isEmpty && !query.isEmpty {
        ContentUnavailableView.search(text: query)
      }
    }
    .task {
      await searchUsers()
    }
    .refreshable {
      await searchUsers()
    }
  }
}

#Preview {
  SearchUsersView(query: "apple")
}
