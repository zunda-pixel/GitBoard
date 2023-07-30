//
//  PullDetailOnlineView.swift
//

import GitHubAPI
import SwiftUI

struct PullDetailOnlineView: View {
  @Environment(ErrorHandle.self) var errorHandle
  
  let ownerID: String
  let repositoryName: String
  let pullNumber: Int
  
  @State var pull: Pull? = nil
  
  func populate() async {
    do {
      self.pull = try await GitHubAPI().pull(
        ownerID: ownerID,
        repositoryName: repositoryName,
        pullNumber: pullNumber
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    if let pull {
      let viewState = RepositoryPullDetailViewState(pull: pull)
      PullDetailView(viewState: viewState)
    } else {
      ProgressView()
        .task {
          await populate()
        }
    }
  }
}

#Preview{
  PullCell(pull: .sample)
}
