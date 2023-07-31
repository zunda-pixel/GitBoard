//
//  ReleaseDetailView.swift
//

import SwiftUI
import GitHubAPI

struct ReleaseDetailView: View {
  @EnvironmentObject var router: NavigationRouter
  
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
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(.userDetail(user: repository.owner!))
        }
        
        Text("/").foregroundStyle(.secondary)
        
        Text(repository.name)
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
      
      Text(LocalizedStringKey(release.body))
      
      ScrollView(.horizontal) {
        if let reaction = release.reactions {
          HStack(alignment: .center, spacing: 10) {
            ReactionsView(reaction: reaction)
          }
        }
      }
    }
  }
  
  var body: some View {
    List {
      header
        .listRow()
      
      Section("INFO") {
        Label(release.tagName, systemImage: "tag")
          .listRowSeparator(.hidden)
      }
    }
    .listStyle(.plain)
  }
}

#Preview {
  ReleaseDetailView(
    repository: .swift,
    release: .sample
  )
}
