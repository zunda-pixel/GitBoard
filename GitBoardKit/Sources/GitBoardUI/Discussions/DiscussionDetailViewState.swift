//
//  DiscussionDetailViewState.swift
//

import Foundation
import Observation
import GitHubData
import GitBoardData

protocol DiscussionDetailViewState: Observable {
  associatedtype Discussion: DiscussionProtocol
  var repository: GitHubData.Repository { get }
  var discussion: Discussion { get }
  var comments: [GitHubData.Discussion.Comment] { get set }
}
