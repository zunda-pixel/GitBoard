//
//  MarkdownView.swift
//

import SwiftUI
import MarkdownView
import Markdown

struct MarkdownView: View {
  let source: String
  
  var contents: [MarkupContent] {
    let document = Document(
      parsing: source,
      options: []
    )
    return MarkdownViewParser.parse(document: document)
  }
  
  var body: some View {
    LazyVStack(alignment: .leading, spacing: 5) {
      ForEach(contents.indexed(), id: \.index) { _, content in
        MarkupContentView(content: content, listDepth: 0)
      }
    }
  }
}
