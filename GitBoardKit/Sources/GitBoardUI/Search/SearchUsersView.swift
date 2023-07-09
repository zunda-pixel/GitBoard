//
//  SearchUsersView.swift
//

import SwiftUI
import GitHubKit

struct SearchUsersView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @State var query: String = ""
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
      }
    }
    .overlay {
      if users.isEmpty && !query.isEmpty {
        ContentUnavailableView.search(text: query)
      }
    }
    .searchable(text: $query)
    .onSubmit(of: .search) {
      Task {
        await searchUsers()
      }
    }
  }
}

#Preview {
  SearchUsersView()
}
