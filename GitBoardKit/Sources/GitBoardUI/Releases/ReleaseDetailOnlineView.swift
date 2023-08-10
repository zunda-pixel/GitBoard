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
    ReleaseDetailView(repository: repository, release: release ?? .sample)
      .redacted(reason: release == nil ? .placeholder : [])
      .task {
        await populate()
      }

  }
}

#Preview {
  ReleaseDetailOnlineView(
    repository: .sample,
    releaseID: 114412910
  )
}
