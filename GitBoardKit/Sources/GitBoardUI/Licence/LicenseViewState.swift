//
//  LicenseViewState.swift
//

import Foundation
import GitHubAPI
import Observation

@Observable
final class LicenseViewState {
  let ownerID: String
  let repositoryName: String
  var licenseContent: String?

  init(
    ownerID: String,
    repositoryName: String
  ) {
    self.ownerID = ownerID
    self.repositoryName = repositoryName
  }

  func populateLicense() async throws {
    let license = try await GitHubAPI().license(
      ownerID: ownerID,
      repositoryName: repositoryName
    )

    self.licenseContent = decodeLicense(license: license)
  }

  func decodeLicense(license: License) -> String {
    switch license.encoding {
    case .base64:
      let data = Data(base64Encoded: license.content, options: .ignoreUnknownCharacters)!
      return String(decoding: data, as: UTF8.self)
    }
  }
}
