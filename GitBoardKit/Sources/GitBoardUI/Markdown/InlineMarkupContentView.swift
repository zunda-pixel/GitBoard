//
//  File 2.swift
//  
//
//  Created by zunda on 2023/09/13.
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
                LazyImage(url: imageURL) { state in
                  if let image = state.image {
                    image
                      .resizable()
                      .scaledToFit()
                      .frame(maxWidth: imageMaxWidth)
                  } else {
                    Text(title)
                  }
                }
              }
            } else {
              LazyImage(url: imageURL) { state in
                if let image = state.image {
                  image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: imageMaxWidth)
                } else {
                  Text(title)
                }
              }
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
