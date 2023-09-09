//
//  ReleaseDetailView.swift
//

import GitHubAPI
import SwiftUI

struct ReleaseDetailView: View {
  @Environment(NavigationRouter.self) var router

  let repository: Repository
  let release: Release

  var header: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(alignment: .center, spacing: 10) {
        HStack(alignment: .center, spacing: 10) {
          UserProfileImage(
            avatarURL: repository.owner!.avatarURL,
            type: repository.owner!.type
          )
          .frame(width: 30, height: 30)

          Text(repository.owner!.userID)
        }
        .bold()
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(.userDetail(user: repository.owner!))
        }

        Text("/").foregroundStyle(.secondary)

        Text(repository.name)
          .bold()
          .contentShape(.rect)
          .onTapGesture {
            router.items.append(.repositoryDetail(repository: repository))
          }
      }

      Text(release.name)
        .font(.title)
        .bold()

      if release.prerelease {
        Text("Pre-release")
          .padding(.horizontal, 10)
          .padding(.vertical, 6)
          .foregroundStyle(.orange)
      }

      HStack(alignment: .center, spacing: 10) {
        HStack(alignment: .center, spacing: 10) {
          UserProfileImage(
            avatarURL: release.author.avatarURL,
            type: release.author.type
          )
          .frame(width: 30, height: 30)

          Text(release.author.userID)
        }
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(.userDetail(user: release.author))
        }

        Text("released")

        Text(release.publishedAt, style: .date)
      }

      if let body = release.body {
        MarkdownView(source: body)
      }

      ScrollView(.horizontal) {
        if let reaction = release.reactions {
          HStack(alignment: .center, spacing: 10) {
            ReactionsView(reaction: reaction)
          }
        }
      }
    }
  }

  @ViewBuilder
  var assetsSection: some View {
    if !release.assets.isEmpty {
      Section("Assets") {
        ForEach(release.assets) { asset in
          ShareLink(item: asset.browserDownloadURL) {
            Label {
              HStack(alignment: .center, spacing: 10) {
                Text(asset.name)
                Text(Int64(asset.size), format: .byteCount(style: .file))
                Spacer()
                Image(systemName: "tray.and.arrow.down")
                  .foregroundStyle(.tint)
              }
              .contentShape(.rect)
            } icon: {
              Image(systemName: "doc.zipper")
            }
          }
        }
      }
    }
  }

  var body: some View {
    List {
      header
        .padding(15)
        .listRow()

      assetsSection

      Section("INFO") {
        Label(release.tagName, systemImage: "tag")
          .listRowSeparator(.hidden)
      }
    }
    .listStyle(.plain)
  }
}

#Preview {
  NavigationStack {
    ReleaseDetailView(
      repository: .sample,
      release: .sample
    )
  }
  .environment(ErrorHandle())
  .environment(NavigationRouter())
}
