//
//  Env.swift
//

import Foundation

public enum Env {
  static public let appGroup = "group.zunda.gitboard"
  static var appIdentifierPrefix: String {
    var teamID = Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String
    if teamID.last == "." {
      teamID.removeLast()  // remove [.] dot
    }
    return teamID
  }
}
