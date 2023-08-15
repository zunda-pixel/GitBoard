//
//  NotificationsViewState.swift
//

import Foundation
import GitHubAPI
import Observation

@Observable
final class NotificationsViewState {
  var _notifications: [GitHubData.Notification] = []
  var notifications: [GitHubData.Notification] {
    _notifications.lazy
      .uniqued(keyPath: \.id)
      .sorted(using: KeyPathComparator(\.id, order: .reverse))
  }
  
  var page: Int = 1
  
  func populateNotifications() async throws {
    page = 1
    
    let newNotifications = try await GitHubAPI().notifications(
      all: true,
      participating: false,
      since: nil,
      before: nil,
      perPage: 30,
      page: page
    )
    
    _notifications = newNotifications
  }
  
  func populateMoreNotifications(id: GitHubData.Notification.ID) async throws {
    guard id == notifications.last?.id else { return }
    page += 1
    
    let newNotifications = try await GitHubAPI().notifications(
      all: true,
      participating: false,
      since: nil,
      before: nil,
      perPage: 30,
      page: page
    )
    
    _notifications.append(contentsOf: newNotifications)
  }
}
