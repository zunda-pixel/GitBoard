//
//  ReleaseCell.swift
//

import SwiftUI
import GitHubAPI

struct ReleaseCell: View {
  let release: Release
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(release.name)
        .font(.title)
        .bold()
      
      reactions(reaction: release.reactions)
      
      HStack(alignment: .center, spacing: 10) {
        Text(release.publishedAt, format: .dateTime)
        if release.prerelease {
          Text("Pre-release")
            .foregroundStyle(.orange)
        }
      }
    }
  }
  
  @ViewBuilder
  func reactions(reaction: Reaction?) -> some View {
    ScrollView(.horizontal) {
      HStack(alignment: .center, spacing: 10) {
        if let reaction {
          ReactionsView(reaction: reaction)
        }
      }
    }
  }
}

#Preview {
  ReleaseCell(release: .sample)
}
