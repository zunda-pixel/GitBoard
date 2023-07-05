//
//  ErrorView.swift
//

import SwiftUI

struct ErrorView: View {
  let error: Error
  
  var body: some View {
    VStack(alignment: .center, spacing: 5) {
      Label {
        Text("Error")
          .bold()
      } icon: {
        Image(systemName: "exclamationmark.circle")
          .foregroundStyle(.green)
      }
      Text(error.localizedDescription)
        .lineLimit(2)
    }
      .padding()
      .toastView()
  }
}

private enum SomeError: Error {
  case some
}

#Preview {
  ErrorView(error: SomeError.some)
}
