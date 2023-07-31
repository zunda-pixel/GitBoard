//
//  RepositoryDetailView.swift
//

import GitHubAPI
import SwiftUI

struct RepositoryDetailView: View {
  @EnvironmentObject var router: NavigationRouter

  let repository: Repository

  var repositoryView: some View {
    VStack(alignment: .leading, spacing: 5) {
      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(
          avatarURL: repository.owner!.avatarURL,
          type: repository.owner!.type
        )
        .frame(width: 30, height: 30)

        Text(repository.owner!.userID)
      }
      .foregroundStyle(.secondary)
      .contentShape(.rect)
      .onTapGesture {
        router.items.append(.userDetail(user: repository.owner!))
      }

      Text(repository.name)
        .font(.largeTitle)
        .bold()

      if let description = repository.description {
        Text(description)
      }

      HStack(alignment: .center, spacing: 10) {
        HStack(alignment: .center, spacing: 5) {
          Image(systemName: "star")
            .foregroundStyle(.secondary)
          if let stargazersCount = repository.stargazersCount {
            Text("\(stargazersCount)")
          }
          Text("stars")
            .foregroundStyle(.secondary)
        }
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(
            .stargazers(
              ownerID: repository.owner!.userID,
              repositoryName: repository.name
            )
          )
        }

        HStack(alignment: .center, spacing: 5) {
          Image(systemName: "arrow.branch")
            .foregroundStyle(.secondary)
          
          if let forksCount = repository.forksCount {
            Text("\(forksCount)")
          }
          
          Text("forks")
            .foregroundStyle(.secondary)
        }
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(
            .forks(
              ownerID: repository.owner!.userID,
              repositoryName: repository.name
            )
          )
        }
      }
    }
  }

  func label<Content: View>(
    systemImage: String, imageColor: Color, @ViewBuilder label: @escaping () -> Content
  ) -> some View {
    Label {
      HStack(alignment: .center, spacing: 0) {
        label()
        Spacer()
        Image(systemName: "chevron.right")
          .foregroundStyle(.secondary)
      }
    } icon: {
      Image(systemName: systemImage)
        .foregroundStyle(imageColor)
    }
  }

  func label(_ titleKey: LocalizedStringKey, systemImage: String, imageColor: Color) -> some View {
    Label {
      HStack(alignment: .center, spacing: 0) {
        Text(titleKey)
        Spacer()
        Image(systemName: "chevron.right")
          .foregroundStyle(.secondary)
      }
    } icon: {
      Image(systemName: systemImage)
        .foregroundStyle(imageColor)
    }
  }

  @ViewBuilder
  var links: some View {
    Section("Links") {
      label(systemImage: "dot.circle", imageColor: .green) {
        HStack(alignment: .center, spacing: 0) {
          Text("Issues")
          Spacer()
          if let openIssuesCount = repository.openIssuesCount, openIssuesCount > 0 {
            Text("\(openIssuesCount)")
          }
        }
      }
      .contentShape(.rect)
      .onTapGesture {
        router.items.append(.issue(
          ownerID: repository.owner!.userID,
          repository: repository
        ))
      }
      
      label("Pull Requests", systemImage: "arrow.triangle.pull", imageColor: .blue)
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(.repositoryPulls(
            ownerID: repository.owner!.userID,
            repositoryName: repository.name
          ))
        }
      
      label("Contributors", systemImage: "person.2", imageColor: .orange)
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(.contributors(
            ownerID: repository.owner!.userID,
            repositoryName: repository.name
          ))
        }
      
      if let license = repository.license {
        label(systemImage: "building.columns", imageColor: .red) {
          HStack(alignment: .center, spacing: 0) {
            Text("License")
            Spacer()
            Text(license.name)
          }
        }
        .contentShape(.rect)
        .onTapGesture {
          router.items.append(.license(
            ownerID: repository.owner!.userID,
            repositoryName: repository.name
          ))
        }
      }
    }
  }

  var body: some View {
    List {
      Section {
        repositoryView
          .listRow()
      }

      links
    }
    .listStyle(.plain)
  }
}

#Preview{
  NavigationStack {
    RepositoryDetailView(repository: .swift)
  }
  .environmentObject(NavigationRouter())
}
