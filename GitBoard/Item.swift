//
//  Item.swift
//  GitBoard
//
//  Created by zunda on 2023/06/28.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
