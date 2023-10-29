//
//  EventForkCell.swift
//

import SwiftUI
import GitHubData

struct EventForkCell: View {
  @Environment(NavigationRouter.self) var router
  
  let repository: GitHubData.Repository
  
  var body: some View {
    Label {
      Text("Forked \(repository.owner!.userID) / \(repository.name)")
    } icon: {
      Image(systemName: "arrow.triangle.branch")
    }
    .onTapGesture {
      router.items.append(.repositoryDetail(repository: repository))
    }
  }
}
