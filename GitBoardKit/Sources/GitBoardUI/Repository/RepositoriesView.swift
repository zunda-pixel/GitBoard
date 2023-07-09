//
//  RepositoriesView.swift
//

import SwiftUI
import GitHubKit

struct RepositoriesView: View {
  let userID: String
  
  @State var repostitories: [Repository] = []
  var body: some View {
    List {
      ForEach(repostitories) { repository in
          RepositoryCell(repository: repository)
      }
    }
  }
}

#Preview {
  RepositoriesView(userID: "zunda-pixel")
}
