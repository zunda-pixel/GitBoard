//
//  SearchView.swift
//

import SwiftUI
import ToastView

struct SearchView: View {
  @Bindable var router = NavigationRouter()
  @State var errorHandle = ErrorHandle()
  
  var body: some View {
    NavigationStack(path: $router.items) {
      List {
        NavigationLink(item: .searchUsers) {
          Label("Search Users", systemImage: "figure.pilates")
        }
        
        NavigationLink(item: .searchRepositories) {
          Label("Search Repositories", systemImage: "figure.pilates")
        }
      }
      #if os(macOS)
      .listStyle(.bordered)
      #else
      .listStyle(.insetGroup)
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
