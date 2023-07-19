//
//  LoginView.swift
//

import GitBoardData
import GitHubAPI
import KeychainSwift
import SwiftUI

struct LoginView<Content: View>: View {
  @Environment(\.openURL) var openURL
  @Environment(ErrorHandle.self) var errorHandle
  @Binding var currentUser: User?
  let label: Content

  init(currentUser: Binding<User?>, @ViewBuilder label: @escaping () -> Content) {
    self._currentUser = currentUser
    self.label = label()
  }

  func accessToken(code: String) async throws -> String {
    let oauth = OAuth(
      clientID: Env.clientID,
      clientSecret: Env.clientSecret,
      code: code
    )
    let authorized = try await oauth.authorize()
    return authorized.accessToken
  }

  func authorize(url: URL) async {
    let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    guard let code = urlComponents.queryItems?.first(where: { $0.name == "code" })?.value else {
      return
    }
    do {
      let accessToken = try await accessToken(code: code)
      let api = GitHubAPI(accessToken: accessToken)
      let me = try await api.me()

      KeychainSwift.shared.setAccessToken(userID: me.id, accessToken: accessToken)
      currentUser = me
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    Button {
      let url = OAuthRequest(clientID: Env.clientID, scopes: Scope.allCases).authorizingURL()
      openURL(url)
    } label: {
      label
    }
    .onOpenURL { url in
      Task {
        await authorize(url: url)
      }
    }
  }
}
