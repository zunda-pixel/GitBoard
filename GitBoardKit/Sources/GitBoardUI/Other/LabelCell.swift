//
//  LabelCell.swift
//

import SwiftUI
import GitHubKit

struct LabelCell: View {
  let label: GitHubKit.Label
  
  var body: some View {
    let color = Color(hex: label.color).opacity(3.0)
    Text(label.name)
      .padding(.horizontal, 8)
      .padding(.vertical, 2)
      .overlay {
        Capsule()
          .stroke(color, lineWidth: 1)
      }
      .background(color.opacity(0.1))
      .clipShape(.capsule)
  }
}

#Preview {
  VStack {
    LabelCell(
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
