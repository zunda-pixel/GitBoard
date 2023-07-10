//
//  RepositoryDetailView.swift
//

import SwiftUI
import GitHubKit

struct RepositoryDetailView: View {
  let repository: Repository
  
  var repositoryView: some View {
    VStack(alignment: .leading, spacing: 5) {
      HStack(alignment: .center, spacing: 10) {
        UserProfileImage(avatarURL: repository.owner.avatarURL, type: repository.owner.type)
          .frame(width: 50, height: 50)
        
        Text(repository.owner.userID)
      }
      .foregroundStyle(.secondary)
      
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
  
  func label<Content: View>(systemImage: String, imageColor: Color, @ViewBuilder  label: @escaping () -> Content) -> some View {
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
    NavigationLink(item: .issue) {
      label(systemImage: "dot.circle", imageColor: .green) {
        HStack(alignment: .center, spacing: 0) {
          Text("Issues")
          Spacer()
          Text("\(repository.openIssuesCount)")
          
        }
      }
    }
    
    NavigationLink(item: .pullRequests) {
      label("Pull Requests", systemImage: "arrow.triangle.pull", imageColor: .blue)
    }
    
    NavigationLink(item: .discussions) {
      label("Discussions", systemImage: "bubble", imageColor: .purple)
    }
    
    NavigationLink(item: .actions) {
      label("Actions", systemImage: "play.circle", imageColor: .yellow)
    }
    
    NavigationLink(item: .contributors) {
      label("Contributors", systemImage: "person.2", imageColor: .orange)
    }
    
    NavigationLink(item: .watchers) {
      label(systemImage: "eye", imageColor: .yellow) {
        HStack(alignment: .center, spacing: 0) {
          Text("Watchers")
          Spacer()
          Text("\(repository.watchersCount)")
        }
      }
      
    }
    
    NavigationLink(item: .license) {
      label("License", systemImage: "building.columns", imageColor: .red)
    }
  }
  
  var body: some View {
    List {
      Section {
        repositoryView
          .listRowSeparator(.hidden)
      }
      
      Section {
        links
      }
      
      Section("Branch") {
        NavigationLink(item: .actions) {
          Label("Actions", systemImage: "house")
        }
      }
      
    }
    .listStyle(.plain)
  }
}

#Preview {
  NavigationStack {
    RepositoryDetailView(repository: .sample)
  }
}
