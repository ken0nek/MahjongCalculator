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

enum Honba {
    case Zeroth, First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth
    
    func toString() -> String {
        switch self {
        case .Zeroth: return ""
        case .First: return "一本場"
        case .Second: return "二本場"
        case .Third: return "三本場"
        case .Fourth: return "四本場"
        case .Fifth: return "五本場"
        case .Sixth: return "六本場"
        case .Seventh: return "七本場"
        case .Eighth: return "八本場"
        }
    }
    
    mutating func next()  {
        switch self {
        case .Zeroth:
            self = First
        case .First:
            self = Second
        case .Second:
            self = Third
        case .Third:
            self = Fourth
        case .Fourth:
            self = Fifth
        case .Fifth:
            self = Sixth
        case .Sixth:
            self = Seventh
        case .Seventh:
            self = Eighth
        case .Eighth:
            self = Zeroth
        }
    }
    
    mutating func reset() {
        self = Zeroth
    }
}

class Game: NSObject {
    var round: Round
    var hand: Hand
    var honba: Honba
    var players: [Player]
    var startingPlayer: Player
    
    init(players: [Player], startingPlayer: Player) {
        self.round = .East
        self.hand = .First
        self.honba = .First
        self.players = players
        self.startingPlayer = startingPlayer
    }
    
    func forwardGame() {
        
        for player in players {
            player.feng.next()
        }
        
        if hand == Hand.Fourth {
            
            round.next()
        }
        
        hand.next()
        
        honba.reset()
    }
    
    func continueGame() {
        honba.next()
    }
}
