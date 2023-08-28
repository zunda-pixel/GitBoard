//
//  DiscussionProtocol.swift
//

import Foundation
import GitHubData

public protocol DiscussionProtocol {
  associatedtype Category: CategoryProtocol
  associatedtype CollectionComment: RandomAccessCollection<GitHubData.Discussion.Comment>
  
  var category: Category { get }
  var title: String { get }
  var createdAt: Date { get }
  var comments: CollectionComment { get }
  var author: GitHubData.Discussion.User? { get }
  var updatedAt: Date { get }
  var body: String { get }
}

public protocol CategoryProtocol {
  var name: String { get }
  var emoji: String { get }
}

extension GitHubData.Discussion: DiscussionProtocol {
  
}

extension GitHubData.Category: CategoryProtocol {
  
}

extension GitBoardData.Category: CategoryProtocol {
  
}

extension GitBoardData.Discussion: DiscussionProtocol {
  
}
