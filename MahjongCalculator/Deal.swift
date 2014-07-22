//
//  Deal.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/17/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class Deal: NSObject {
    var round: Round
    var hand: Hand
    var honba: Honba
    var player1: Player
    var player2: Player
    var player3: Player
    var player4: Player
    var poolPoints: Int = 0
    
    init(_ game: Game)  {
        self.round = game.round
        self.hand = game.hand
        self.honba = game.honba
        self.player1 = game.players[0]
        self.player2 = game.players[1]
        self.player3 = game.players[2]
        self.player4 = game.players[3]
        self.poolPoints = game.poolPoints
    }
}
