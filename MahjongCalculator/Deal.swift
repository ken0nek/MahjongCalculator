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
    var players: [Player]
    var poolPoints: Int = 0
    
    init(_ game: Game)  {
        self.round = game.round
        self.hand = game.hand
        self.honba = game.honba
        self.players = game.players
        self.poolPoints = game.poolPoints
    }
}
