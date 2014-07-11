//
//  Game.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

enum Round {
    case East, South, West, North
    
    func toString() -> String {
        switch self {
        case .East: return "東"
        case .South: return "南"
        case .West: return "西"
        case .North: return "北"
        }
    }
}

enum Hand {
    case First, Second, Third, Fourth
    
    func toString() -> String {
        switch self {
        case .First: return "一局"
        case .Second: return "二局"
        case .Third: return "三局"
        case .Fourth: return "四局"
        }
    }
}

class Game: NSObject {
    var round: Round
    var hand: Hand
    var players: [Player]
    
    init(players: [Player]) {
        self.round = .East
        self.hand = .First
        self.players = players
    }
    
    func nextRound() {
        switch self.round {
        case .East:
            self.round = .South
        case .South:
            self.round = .West
        case .West:
            self.round = .North
        case .North:
            self.round = .East
        }
    }
    
    func nextHand()  {
        switch self.hand {
        case .First:
            self.hand = .Second
        case .Second:
            self.hand = .Third
        case .Third:
            self.hand = .Fourth
        case .Fourth:
            self.hand = .First
            nextRound()
        }
    }
}
