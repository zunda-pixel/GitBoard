//
//  RepositoryDetailView.swift
//

import GitHubAPI
import SwiftUI

struct RepositoryDetailView: View {
  @Environment(NavigationRouter.self) var router

  let repository: Repository

  var repositoryView: some View {
    VStack(alignment: .leading, spacing: 5) {
      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(avatarURL: repository.owner!.avatarURL, type: repository.owner!.type)
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
          Text("\(repository.stargazersCount)")
          Text("stars")
            .foregroundStyle(.secondary)
        }

        HStack(alignment: .center, spacing: 5) {
          Image(systemName: "arrow.branch")
            .foregroundStyle(.secondary)
          Text("\(repository.forksCount)")
          Text("forks")
            .foregroundStyle(.secondary)
        }
      }
    }
  }

  func label<Content: View>(
    systemImage: String, imageColor: Color, @ViewBuilder label: @escaping () -> Content
  ) -> some View {
    Label {
      label()
    } icon: {
      Image(systemName: systemImage)
        .foregroundStyle(imageColor)
    }
  }

  func label(_ titleKey: LocalizedStringKey, systemImage: String, imageColor: Color) -> some View {
    Label {
      Text(titleKey)
    } icon: {
      Image(systemName: systemImage)
        .foregroundStyle(imageColor)
    }
  }

  @ViewBuilder
  var links: some View {
    NavigationLink(item: .issue(ownerID: repository.owner!.userID, repository: repository)) {
      label(systemImage: "dot.circle", imageColor: .green) {
        HStack(alignment: .center, spacing: 0) {
          Text("Issues")
          Spacer()
          Text("\(repository.openIssuesCount)")
        }
      }
    }

    NavigationLink(
      item: .repositoryPulls(ownerID: repository.owner!.userID, repositoryName: repository.name)
    ) {
      label("Pull Requests", systemImage: "arrow.triangle.pull", imageColor: .blue)
    }

    NavigationLink(
      item: .contributors(ownerID: repository.owner!.userID, repositoryName: repository.name)
    ) {
      label("Contributors", systemImage: "person.2", imageColor: .orange)
    }

    if let license = repository.license {
      NavigationLink(
        item: .license(ownerID: repository.owner!.userID, repositoryName: repository.name)
      ) {
        label(systemImage: "building.columns", imageColor: .red) {
          HStack(alignment: .center, spacing: 0) {
            Text("License")
            Spacer()
            Text(license.name)
          }
        }
      }
    }
  }

  var body: some View {
    List {
      Section {
        repositoryView
          .listRowSeparator(.hidden)
      }

      Section("Links") {
        links
      }
    }
    .listStyle(.plain)
  }
}

#Preview{
  NavigationStack {
    RepositoryDetailView(repository: .swift)
  }
  .environment(NavigationRouter())
}
