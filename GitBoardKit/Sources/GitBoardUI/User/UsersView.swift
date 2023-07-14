//
//  UsersView.swift
//

import SwiftUI
import GitHubKit

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
  
  func populateMore(id: User.ID) async {
    do {
      try await viewState.populateMoreUsers(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(viewState.users) { user in
        UserCell(user: user)
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
  var users: [User] = []
  
  func populateUsers() async throws {
    users = [
      .sample,
    ]
  }
  
  func populateMoreUsers(id: User.ID) async throws {
    users = [
      .sample,
    ]
  }
}

#Preview {
  NavigationStack {
    let viewState = TestUsersViewState()
    UsersView(viewState: viewState)
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}