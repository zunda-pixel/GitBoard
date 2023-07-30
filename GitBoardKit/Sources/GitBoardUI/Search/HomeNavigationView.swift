//
//  HomeNavigationView.swift
//

import SwiftUI
import ToastView

struct HomeNavigationView: View {
  @Bindable var router = NavigationRouter()
  @State var query: String = ""
  @State var isPresentedKeyboard = false

  var body: some View {
    NavigationStack(path: $router.items) {
      List {
      }
      .searchable(text: $query, isPresented: $isPresentedKeyboard, prompt: "Search GitHub")
      .listStyle(.plain)
      .navigationDestination()
      .navigationTitle("Home")
      .overlay {
        if isPresentedKeyboard {
          if query.trimmingCharacters(in: .whitespaces).isEmpty {
            VStack(alignment: .center, spacing: 40) {
              Text("Find your stuff.")
                .bold()
                .font(.title)

              Text(
                "Search all of GitHub for People, Repositories, Organizations, Issues, and Pull Requests."
              )
              .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(.background)
          } else {
            List {
              let query = query.trimmingCharacters(in: .whitespaces)

              NavigationLink(item: .searchUsers(query: query)) {
                Label("Search Users", systemImage: "person.2")
              }

              NavigationLink(item: .searchRepositories(query: query)) {
                Label("Search Repositories", systemImage: "book.pages")
              }
            }
            .listStyle(.automatic)
          }
        }
      }
    }
    .environment(router)
  }
}

#Preview{
  HomeNavigationView()
}