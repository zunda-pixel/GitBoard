//
//  ReleasesView.swift
//

import SwiftUI
import GitHubAPI

struct ReleasesView: View {
  @EnvironmentObject var router: NavigationRouter
  @Environment(ErrorHandle.self) var errorHandle
  @State var viewState: ReleasesViewState
  
  func populate() async {
    do {
      try await viewState.populateReleases()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  func populateMore(id: GitHubData.Release.ID) async {
    do {
      try await viewState.populateMoreReleases(id: id)
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    List {
      ForEach(viewState.releases) { release in
        VStack(alignment: .leading, spacing: 0) {
          ReleaseCell(release: release)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Divider()
        }
        .listRow()
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

#Preview {
  NavigationStack {
    let viewState = ReleasesViewState(
      ownerID: "apple",
      repositoryName: "swift"
    )
    ReleasesView(viewState: viewState)
  }
  .environment(ErrorHandle())
}
