//
//  MarkupContentView.swift
//

import SwiftUI
import MarkdownView

struct MarkupContentView: View {
  let content: MarkupContent

  init(content: MarkupContent) {
    self.content = content
  }

  var body: some View {
    switch content {
    case .text(let text):
      SwiftUI.Text(text)
    case .thematicBreak:
      Divider()
    case .inlineCode(let code):
      InlineCodeView(code: code)
    case .strong(let children):
      InlineMarkupContentView(inlineContents: children)
        .bold()
    case .strikethrough(let children):
      InlineMarkupContentView(inlineContents: children)
        .strikethrough(pattern: .dash, color: .secondary)
    case .emphasis(let children):
      InlineMarkupContentView(inlineContents: children)
        .italic()
    case .doxygenParameter(let name, let children):
      DoxygenParameterView(name: name, children: children)
    case .doxygenReturns(let children):
      DoxygenReturnsView(children: children)
    case .blockDirective(let name, let arguments, let children):
      BlockDirectiveView(name: name, arguments: arguments, children: children)
    case .htmlBlock(let html):
      WebView(html: html)
    case .codeBlock(let language, let sourceCode):
      CodeBlockView(language: language, sourceCode: sourceCode)
    case .link(let destination, let children):
      LinkView(destination: destination, children: children)
    case .heading(let level, let children):
      HeadingView(level: level, children: children)
    case .paragraph(let children):
      InlineMarkupContentView(inlineContents: children)
    case .blockQuote(let kind, let children):
      BlockQuoteView(kind: kind, children: children)
    case .orderedList(let startIndex, let items):
      OrderedListView(startIndex: startIndex, items: items)
    case .unorderedList(let items):
      UnorderedListView(items: items)
    case .table(let head, let body):
      TableView(headItems: head, bodyItems: body)
    case .softBreak:
      EmptyView()
    }
  }
}