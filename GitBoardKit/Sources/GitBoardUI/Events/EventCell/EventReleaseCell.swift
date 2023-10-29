//
//  EventReleaseCell.swift
//

import SwiftUI
import GitHubData

struct EventReleaseCell: View {
  @Environment(NavigationRouter.self) var router

  let action: String
  let release: Release

  var ownerID: String { release.htmlURL.pathComponents[1] }
  var repositoryName: String { release.htmlURL.pathComponents[2] }

  var body: some View {
    Label {
      VStack(alignment: .leading) {
        Text("Release \(action) \(release.name)")

        Text("\(ownerID) / \(repositoryName)")
          .foregroundStyle(.secondary)

        Text(release.tagName)
        
        if let body = release.body?.split(whereSeparator: \.isNewline).first {
          Text(body)
            .lineLimit(1)
        }
      }
    } icon: {
      Image(systemName: "tag")
        .foregroundStyle(.green)
    }
    .onTapGesture {
      router.items.append(.releaseDetailOnlineWithoutRepository(
        ownerID: ownerID,
        repositoryName: repositoryName,
        release: release
      ))
    }
  }
}
