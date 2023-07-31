//
//  ReactionsView.swift
//

import SwiftUI
import GitHubAPI

struct ReactionsView: View {
  let reaction: Reaction
  
  var body: some View {
    if reaction.plusOne > 0 {
      reactionView(emoji: "👍", count: reaction.plusOne)
    }
    if reaction.minusOne > 0 {
      reactionView(emoji: "👎", count: reaction.minusOne)
    }
    if reaction.laughCount > 0 {
      reactionView(emoji: "😄", count: reaction.laughCount)
    }
    if reaction.hoorayCount > 0 {
      reactionView(emoji: "🎉", count: reaction.hoorayCount)
    }
    if reaction.confusedCount > 0 {
      reactionView(emoji: "😕", count: reaction.confusedCount)
    }
    if reaction.heartCount > 0 {
      reactionView(emoji: "❤️", count: reaction.heartCount)
    }
    
    if reaction.rockerCount > 0 {
      reactionView(emoji: "🚀", count: reaction.rockerCount)
    }
    if reaction.eyesCount > 0 {
      reactionView(emoji: "👀", count: reaction.eyesCount)
    }
  }
  
  @ViewBuilder
  func reactionView(emoji: String, count: Int) -> some View{
    HStack(alignment: .center, spacing: 3) {
      Text(emoji)
      
      Text("\(count)")
        .foregroundStyle(.secondary)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 6)
    .background {
      Capsule()
        .foregroundStyle(.ultraThinMaterial)
    }
  }
}

#Preview {
  ReactionsView(reaction: .sample)
}
