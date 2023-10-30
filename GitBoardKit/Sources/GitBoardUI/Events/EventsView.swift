//
//  EventsView.swift
//

import SwiftUI
import GitHubAPI
import Defaults

struct EventsView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @State var events: [Event] = []
  
  var filteredEvents: [Event] {
    // 表示しても別のページへ遷移できないものに関しては、false
    // 理由: Repository名などが取得できない
    events.filter { event in
      switch event.payload {
      case .push(_, _, _, _, _, _, _, _):
        return false
      case .pullRequest(_, _, _):
        return true
      case .create(_, _, _, _, _):
        return false
      case .issueComment(_, _, _):
        return true
      case .issue(_, _):
        return true
      case .watch(_):
        return false
      case .fork(_):
        return true
      case .delete(_, _, _):
        return false
      case .gollum(_):
        return false
      case .pullRequestReview(_, _, _):
        return true
      case .pullRequestReviewComment(_, _, _):
        return true
      case .release(_, _):
        return true
      case .commitComment(_):
        return true
      case .publicEvent:
        return false
      case .member(_, _):
        return false
      }
    }
  }
  
  func populate() async {
    let user: GitHubData.User? = UserDefaults.shared[.currentUser]

    do {
      if let user {
        self.events = try await GitHubAPI().events(
          userName: user.userID,
          perPage: 100,
          page: 1
        )
      } else {
        self.events = try await GitHubAPI().publicEvents(
          perPage: 100,
          page: 1
        )
      }
    } catch let newError {
      errorHandle.error = .init(error: newError)
    }
  }
  
  var body: some View {
    List {
      ForEach(filteredEvents) { event in
        VStack(alignment: .leading, spacing: 0) {
          EventCell(event: event)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
          Divider()
        }
        .listRow()
      }
    }
    .listStyle(.plain)
    .refreshable {
      await populate()
    }
    .task {
      await populate()
    }
  }
}

#Preview {
  EventsView()
    .environment(ErrorHandle())
    .environment(NavigationRouter())
    .font(.caption2)
}
