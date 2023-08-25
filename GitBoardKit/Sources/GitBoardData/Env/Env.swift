//
//  Env.swift
//

import Foundation

public enum Env {
  static public let clientID: String = <#CLIENT_ID#>
  static public let clientSecret: String = <#CLIENT_SECRET#>
  static public let appGroupPrefix = "group"
  static public let appGroup = "zunda.gitboard"
  static let teamID: String = Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String
}
