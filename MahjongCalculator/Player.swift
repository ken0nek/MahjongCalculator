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
            self = North
        case .South:
            self = East
        case .West:
            self = South
        case .North:
            self = West
        }
    }
}

class Player: NSObject {
    let playerID: Int
    var playerName: String
    var isDealer: Bool {
    get {
        if feng == Feng.East {
            return true
        } else {
            return false
        }
    }
    }
    var playerPoints: Int
    var feng: Feng
    
    // let gameManager: GameManager = GameManager.sharedManager()
    
    init(playerID: Int, playerName: String, playerPoints: Int, feng: Feng) {
        self.playerID = playerID
        self.playerName = playerName
        self.playerPoints = playerPoints
        self.feng = feng
    }
    
    convenience init(playerID: Int, playerName: String, feng: Feng) {
        self.init(playerID: playerID, playerName: playerName, playerPoints: 25000, feng: feng)
    }
    
}
