//
//  HomeNavigationView.swift
//

import SwiftUI
import ToastView

struct HomeNavigationView: View {
  let trigger: TabTrigger
  @StateObject var router = NavigationRouter()
  @State var query: String = ""
  @State var isPresentedKeyboard = false

  func label(
    _ titleKey: LocalizedStringKey,
    systemImage: String
  ) -> some View {
    Label {
      HStack(alignment: .center, spacing: 0) {
        Text(titleKey)
        Spacer()
        Image(systemName: "chevron.right")
          .foregroundStyle(.secondary)
      }
    } icon: {
      Image(systemName: systemImage)
    }
  }
  
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
              
              label("Search Users", systemImage: "person.2")
                .contentShape(.rect)
                .onTapGesture {
                  router.items.append(.searchUsers(query: query))
                }
              
              label("Search Repositories", systemImage: "book.pages")
                .contentShape(.rect)
                .onTapGesture {
                  router.items.append(.searchRepositories(query: query))
                }
            }
            .listStyle(.automatic)
          }
        }
      }
    }
    .environmentObject(router)
    .onTrigger(of: trigger) {
      router.items.removeAll()
    }
  }
}

#Preview{
  HomeNavigationView(trigger: .init())
}
