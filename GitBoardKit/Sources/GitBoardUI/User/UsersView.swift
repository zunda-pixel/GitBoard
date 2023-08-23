//
//  UsersView.swift
//

import GitHubAPI
import SwiftUI

struct UsersView<ViewState: UsersViewState>: View {
  @Environment(ErrorHandle.self) var errorHandle
  @Environment(NavigationRouter.self) var router
  @State var viewState: ViewState

  func populate() async {
    do {
      try await viewState.populateUsers()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  func populateMore(id: GitHubData.User.ID) async {
    do {
      try await viewState.populateMoreUsers(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    List {
      ForEach(viewState.users) { user in
        VStack(alignment: .leading, spacing: 0) {
          UserCell(user: user)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
        .listRow()
        .onTapGesture {
          router.items.append(.userDetail(user: user))
        }
        .task {
          await populateMore(id: user.id)
        }
      }
    }
    .listStyle(.plain)
    .task {
      await populate()
    }
    .refreshable {
      await populate()
    }
  }
}

@Observable
final class TestUsersViewState: UsersViewState {
  var users: [GitHubData.User] = []

  func populateUsers() async throws {
    users = [
      .apple,
      .zunda,
    ]
  }

  func populateMoreUsers(id: GitHubData.User.ID) async throws {
    users.append(.sample)
  }
}

#Preview{
  NavigationStack {
    let viewState = TestUsersViewState()
    UsersView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
