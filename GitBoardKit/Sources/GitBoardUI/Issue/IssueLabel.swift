//
//  IssueLabel.swift
//

import SwiftUI
import GitHubKit

struct IssueLabel: View {
  let label: Issue.Label
  
  var body: some View {
    let color = Color(hex: label.color).opacity(4.0)
    Text(label.name)
      .foregroundStyle(color)
      .padding(.horizontal, 8)
      .padding(.vertical, 2)
      .overlay {
        Capsule()
          .stroke(color, lineWidth: 2)
      }
      .background(color.opacity(0.15))
      .clipShape(.capsule)
  }
}

#Preview {
  VStack {
    IssueLabel(
      label: .init(
        id: 323,
        nodeID: "nodeID",
        url: URL(string: "https://github.com")!,
        name: "Label Name",
        color: "ef77ffff",
        isDefault: false,
        description: "description"
      )
    )
  }
  .frame(maxWidth: 300, maxHeight: 300)
}
