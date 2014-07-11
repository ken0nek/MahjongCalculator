//
//  Game.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class Game: NSObject {
    var round: Round
    var hand: Hand
    
    enum Round {
        case East, South, West, North
    }
    
    enum Hand {
        case First, Second, Third, Fourth
    }
    
    init() {
        
    }
}
