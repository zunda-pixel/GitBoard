//
//  ReleaseDetailOnlineView.swift
//

import SwiftUI
import GitHubAPI

struct ReleaseDetailOnlineView: View {
  @Environment(ErrorHandle.self) var errorHandle
  
  let repository: Repository
  let releaseID: Int

  @State var release: Release? = nil
  
  func populate() async {
    do {
      self.release = try await GitHubAPI().release(
        ownerID: repository.owner!.userID,
        repositoryName: repository.name,
        releaseID: releaseID
      )
    } catch {
      errorHandle.error = .init(error: error)
    }
  }
  
  var body: some View {
    if let release {
      ReleaseDetailView(repository: repository, release: release)
    } else {
      ProgressView()
        .task {
          await populate()
        }
    }
  }
}

#Preview {
  ReleaseDetailOnlineView(
    repository: .swift,
    releaseID: 114412910
  )
}
