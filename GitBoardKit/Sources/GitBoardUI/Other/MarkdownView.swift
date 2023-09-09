//
//  MarkdownView.swift
//

import SwiftUI
import MarkdownView
import MarkdownViewParser
import Markdown

struct MarkdownView: View {
  let source: String
  
  var contents: [MarkupContent] {
    let document = Document(parsing: source, options: [.parseBlockDirectives, .parseMinimalDoxygen, .parseSymbolLinks])
    return MarkdownViewParser.parse(document: document)
  }
  
  var body: some View {
    LazyVStack(alignment: .leading, spacing: 5) {
      ForEach(contents.indexed(), id: \.index) { _, content in
        MarkupContentView<InlineMarkupContentView>(content: content, listDepth: 0, isNested: false)
      }
    }
  }
}
