//
//  FollowersView.swift
//

import SwiftUI
import GitBoardData

struct FollowersView<ViewState: FollowersViewState>: View {
  @State var viewState: ViewState
  
  var body: some View {
    List {
      ForEach(viewState.followers, id: \.id) { follower in
        UserCell(user: follower)
      }
    }
    .overlay {
      if viewState.followers.isEmpty {
        ContentUnavailableView.search(text: viewState.userName)
      }
    }
    .listStyle(.plain)
    .refreshable {
      await viewState.fetchFollowers()
    }
    .task {
      await viewState.fetchFollowers()
    }
  }
}

struct FollowersView_Preview: PreviewProvider {
  static var previews: some View {
    let viewState = OnlineFollowersViewState(userName: "zunda-pixel")
    FollowersView(viewState: viewState)
      .frame(maxWidth: 300)
  }
}
