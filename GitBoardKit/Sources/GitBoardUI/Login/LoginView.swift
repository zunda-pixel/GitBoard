//
//  LoginView.swift
//

import GitBoardData
import GitHubAPI
import SwiftUI
import Valet
import WidgetKit

struct LoginView<Content: View>: View {
  @Environment(\.openURL) var openURL
  @Environment(ErrorHandle.self) var errorHandle
  @Binding var currentUser: GitHubData.User?
  let label: Content

  init(currentUser: Binding<GitHubData.User?>, @ViewBuilder label: @escaping () -> Content) {
    self._currentUser = currentUser
    self.label = label()
  }

  func accessToken(code: String) async throws -> String {
    let oauth = OAuth(
      clientID: SecureEnv.clientID,
      clientSecret: SecureEnv.clientSecret,
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

      Valet.shared.setAccessToken(userID: me.id, accessToken: accessToken)

      currentUser = me

      WidgetCenter.shared.reloadAllTimelines()
    } catch {
      errorHandle.error = .init(error: error)
    }
  }

  var body: some View {
    Button {
      let url = OAuthRequest(clientID: SecureEnv.clientID, scopes: Scope.allCases).authorizingURL()
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
