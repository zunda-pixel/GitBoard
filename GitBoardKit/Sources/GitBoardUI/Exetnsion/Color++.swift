//
//  Color++.swift
//

import SwiftUI

extension Color {
  init(hex: String) {
    var rgb: UInt64 = 0
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let opacity: CGFloat
    
    let length = hex.count
    Scanner(string: hex).scanHexInt64(&rgb)
    
    if length == 6 {
      red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
      green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
      blue = CGFloat(rgb & 0x0000FF) / 255.0
      opacity = 1.0
    } else {
      red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
      green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
      blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
      opacity = CGFloat(rgb & 0x000000FF) / 255.0
    }
    
    self.init(red: red, green: green, blue: blue, opacity: opacity)
  }
}
