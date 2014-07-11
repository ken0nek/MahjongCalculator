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
    
    mutating func next()  {
        switch self {
        case .First:
            self = Second
        case .Second:
            self = Third
        case .Third:
            self = Fourth
        case .Fourth:
            self = First
        }
    }
}

class Game: NSObject {
    var round: Round
    var hand: Hand
    var players: [Player]
    var startingPlayer: Player
    
    init(players: [Player], startingPlayer: Player) {
        self.round = .East
        self.hand = .First
        self.players = players
        self.startingPlayer = startingPlayer
    }
    
    func goForward() {
        
        for player in players {
            player.feng.next()
        }
        
        if hand == Hand.Fourth {
            
            round.next()
        }
        
        hand.next()
    }
}
