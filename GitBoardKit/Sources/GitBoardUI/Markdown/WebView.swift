//
//  WebView.swift
//

import SwiftUI
import WebKit

struct WebView {
  let type: WebType
  
  init(type: WebType) {
    self.type = type
  }
  
  init(html: String, baseURL: URL? = nil) {
    self.type = .html(html: html, baseURL: baseURL)
  }
  
  init(urlRequest: URLRequest) {
    self.type = .url(URLRequest: urlRequest)
  }
  
  func updateView(_ view: WKWebView) {
    switch type {
    case .html(let html, let baseURL):
      view.loadHTMLString(html, baseURL: baseURL)
    case .url(let urlRequest):
      view.load(urlRequest)
    }
  }
}

extension WebView {
  enum WebType {
    case html(html: String, baseURL: URL?)
    case url(URLRequest: URLRequest)
  }
}

#if os(macOS)
extension WebView: NSViewRepresentable {
  func makeNSView(context: Context) -> WKWebView {
    return WKWebView()
  }

  func updateNSView(_ view: WKWebView, context: Context) {
    updateView(view)
  }
}
#else
extension WebView: UIViewRepresentable {
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }

  func updateUIView(_ view: WKWebView, context: Context) {
    updateView(view)
  }
}
#endif
