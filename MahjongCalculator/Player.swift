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
    var playerChips: Int
    var isFishing: Bool
    
    init()  {
        self.playerID = 0
        self.playerName = ""
        self.playerPoints = 0
        self.feng = Feng.East
        self.isFishing = false
        self.playerChips = 0
    }
    
    init(playerID: Int, playerName: String, playerPoints: Int, feng: Feng, playerChips: Int) {
        self.playerID = playerID
        self.playerName = playerName
        self.playerPoints = playerPoints
        self.feng = feng
        self.isFishing = false
        self.playerChips = playerChips
    }
    
    convenience init(playerID: Int, playerName: String, feng: Feng) {
        self.init(playerID: playerID, playerName: playerName, playerPoints: 25000, feng: feng, playerChips: 20)
    }
    
    func call() {
        if playerPoints >= 1000 {
            playerPoints -= 1000
            isFishing = true
        }
    }
    
    func fishing() {
        if !isFishing {
            isFishing = true
        }
    }
}
