//
//  SearchView.swift
//

import SwiftUI
import ToastView

struct SearchView: View {
  @Bindable var router = NavigationRouter()
  @State var errorHandle = ErrorHandle()
  @State var query = ""
  
  var body: some View {
    NavigationStack(path: $router.items) {
      List {
        NavigationLink(item: .searchUsers(query: query)) {
          Label("Search Users", systemImage: "person.2")
        }
        
        NavigationLink(item: .searchRepositories(query: query)) {
          Label("Search Repositories", systemImage: "book.pages")
        }
      }
      .searchable(text: $query, prompt: "Search GitHub")
      #if os(macOS)
      .listStyle(.bordered)
      #else
      .listStyle(.insetGrouped)
      #endif
      .navigationDestination()
      .navigationTitle("Search")
    }
    .toastAlert(
      item: $errorHandle.error,
      position: .top,
      animation: .spring,
      duration: .seconds(2)
    ) { error in
      ErrorView(error: error.error)
    }
    .environment(router)
    .environment(errorHandle)
  }
}

#Preview {
  SearchView()
}
