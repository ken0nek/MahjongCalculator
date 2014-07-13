//
//  Player.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

enum Feng {
    case East, South, West, North
    
    func toString() -> String {
        switch self {
        case .East: return "東"
        case .South: return "南"
        case .West: return "西"
        case .North: return "北"
        }
    }
    
    mutating func next() {
        switch self {
        case .East:
            self = South
        case .South:
            self = West
        case .West:
            self = North
        case .North:
            self = East
        }
    }
}

class Player: NSObject {
    let playerID: Int
    var playerName: String
    var isDealer: Bool
    var playerPoints: Int
    var feng: Feng
    
    // let gameManager: GameManager = GameManager.sharedManager()
    
    init(playerID: Int, playerName: String, isDealer: Bool, playerPoints: Int, feng: Feng) {
        self.playerID = playerID
        self.playerName = playerName
        self.isDealer = isDealer
        self.playerPoints = playerPoints
        self.feng = feng
    }
    
    convenience init(playerID: Int, playerName: String, isDealer: Bool, feng: Feng) {
        self.init(playerID: playerID, playerName: playerName, isDealer: isDealer, playerPoints: 25000, feng: feng)
    }
    
}
