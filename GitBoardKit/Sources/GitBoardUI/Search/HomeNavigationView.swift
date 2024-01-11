//
//  HomeNavigationView.swift
//

import SwiftData
import SwiftUI
import ToastView

struct HomeNavigationView: View {
  let trigger: TabTrigger
  @State var router = NavigationRouter()
  @State var query: String = ""
  @State var isPresentedKeyboard = false

  func label(
    _ titleKey: LocalizedStringKey,
    bundle: Bundle,
    systemImage: String
  ) -> some View {
    Label {
      HStack(alignment: .center, spacing: 0) {
        Text(titleKey, bundle: bundle)
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
      EventsView()
      .searchable(text: $query, isPresented: $isPresentedKeyboard, prompt: Text("SearchGitHub", bundle: .module))
      .listStyle(.plain)
      .navigationDestination()
      .navigationTitle(Text("HomeTab", bundle: .module))
      .overlay {
        if isPresentedKeyboard {
          if query.trimmingCharacters(in: .whitespaces).isEmpty {
            VStack(alignment: .center, spacing: 40) {
              Text("FindYourStuff", bundle: .module)
                .bold()
                .font(.title)

              Text("SearchAllOfGitHub", bundle: .module)
                .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(.background)
          } else {
            List {
              let query = query.trimmingCharacters(in: .whitespaces)

              label("SearchUsers", bundle: .module, systemImage: "person.2")
                .contentShape(.rect)
                .onTapGesture {
                  router.items.append(.searchUsers(query: query))
                }

              label("SearchRepositories", bundle: .module, systemImage: "book.pages")
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
    .environment(router)
    .onTrigger(of: trigger) {
      router.items.removeAll()
    }
  }
}

#Preview{
  HomeNavigationView(trigger: .init())
}
