//
//  LicenseView.swift
//

import GitHubKit
import SwiftUI

struct LicenseView: View {
  @Environment(ErrorHandle.self) var errorHandle
  @State var viewState: LicenseViewState

  var body: some View {
    if let licenseContent = viewState.licenseContent {
      ScrollView(.vertical) {
        Text(licenseContent)
      }
    } else {
      ProgressView()
        .task {
          do {
            try await viewState.populateLicense()
          } catch {
            errorHandle.error = .init(error: error)
          }
        }
    }
  }
}
