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
    case let .text(text):
      SwiftUI.Text(text)
    case .thematicBreak:
      Divider()
    case let .inlineCode(code):
      InlineCodeView(code: code)
    case let .strong(children):
      InlineMarkupContentView(inlineContents: children)
        .bold()
    case let .strikethrough(children):
      InlineMarkupContentView(inlineContents: children)
        .strikethrough(pattern: .dash, color: .secondary)
    case let .emphasis(children):
      InlineMarkupContentView(inlineContents: children)
        .italic()
    case let .doxygenParameter(name, children):
      DoxygenParameterView(name: name, children: children)
    case let .doxygenReturns(children):
      DoxygenReturnsView(children: children)
    case let .blockDirective(name, arguments, children):
      BlockDirectiveView(name: name, arguments: arguments, children: children)
    case let .htmlBlock(html):
      WebView(html: html)
    case let .codeBlock(language, sourceCode):
      CodeBlockView(language: language, sourceCode: sourceCode)
    case let .link(destination, title, children):
      LinkView(destination: destination, title: title, children: children)
    case let .heading(level, children):
      HeadingView(level: level, children: children)
    case let .paragraph(children):
      InlineMarkupContentView(inlineContents: children)
    case let .blockQuote(kind, children):
      BlockQuoteView(kind: kind, children: children)
    case let .orderedList(startIndex, items):
      OrderedListView(startIndex: startIndex, items: items)
    case let .unorderedList(items):
      UnorderedListView(items: items)
    case let .table(head, body):
      TableView(headItems: head, bodyItems: body)
    case .softBreak:
      EmptyView()
    }
  }
}
