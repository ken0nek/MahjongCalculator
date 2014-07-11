//
//  Player.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class Player: NSObject {
    var playerID: Int
    var playerName: String
    var isDealer: Bool
    var playerPoints: Int
    
    init(playerID: Int, playerName: String, isDealer: Bool, playerPoints: Int) {
        self.playerID = playerID
        self.playerName = playerName
        self.isDealer = false
        self.playerPoints = playerPoints
    }
    
    convenience init(playerID: Int, playerName: String, isDealer: Bool) {
        self.init(playerID: playerID, playerName: playerName, isDealer: isDealer, playerPoints: 25000)
    }
}
