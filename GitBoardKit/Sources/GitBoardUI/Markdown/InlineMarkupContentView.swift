//
//  InlineMarkupContentView.swift
//

import SwiftUI
import MarkdownView
import NukeUI

struct InlineMarkupContentView: View {
  @Environment(\.font) var font

  let inlineContents: [InlineMarkupContent]
  let imageMaxWidth: CGFloat = 300
  
  var contents: [[MultiContent]] {
    var container = AttributeContainer()
    container.font = font
    let contents = inlineContents.split { content in
      return content == .softBreak || content == .lineBreak
    }

    return contents.map { content in
      let multiContents = MultiContentParser.multiContents(
        contents: content,
        container: container
      ) { _, container in return container }
      let compressedMultiContents = MultiContentParser.compressMultiContents(
        multiContents: multiContents)
      return compressedMultiContents
    }
  }
  
  @MainActor
  @ViewBuilder
  func image(imageURL: URL, title: String) -> some View {
    LazyImage(url: imageURL) { state in
      switch state.result {
      case .success(let result):
          #if os(macOS)
          Image(nsImage: result.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: imageMaxWidth)
          #else
          Image(uiImage: result.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: imageMaxWidth)
          #endif
      case .failure(_):
        Text(title)
      case .none:
        ProgressView(value: state.progress.fraction, total: Float(state.progress.total)) {
          Text(title)
            .frame(maxWidth: .infinity)
        }
      }
    }
  }

  var body: some View {
    ForEach(contents.indexed(), id: \.index) { _, element in
      ForEach(element.indexed(), id: \.index) { _, content in
        switch content {
        case .attributedString(let string):
          Text(string)
        case .image(let title, let source, let link):
          if let imageURL = source.map({ URL(string: $0) }),
            let imageURL
          {
            if let link {
              Link(destination: link) {
                image(imageURL: imageURL, title: title)
              }
            } else {
              image(imageURL: imageURL, title: title)
            }
          }
        case .inlineHTML(let html, let link):
          if let link {
            SwiftUI.Link(destination: link) {
              WebView(html: html)
            }
          } else {
            WebView(html: html)
          }
        }
      }
    }
  }
}
