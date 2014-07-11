//
//  Points.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/11/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

//enum WinType {
//    case SelfPick, Discard
//}

struct Yaku {
    let fan: Int
    let fu: Int
    
    init() {
        self.fan = 0
        self.fu = 0
    }
    
    init(fan: Int, fu: Int) {
        self.fan = fan
        self.fu = fu
    }
    
    func calculatePoints(winPlayer: Player, targetPlayer: Player?) -> Points {
        
        if winPlayer.isDealer {
            if targetPlayer {
                return calculateDealerDiscardPoints()
            } else {
                return calculateDealerSelfPickPoints()
            }
        } else {
            if targetPlayer {
               return calculateDiscardPoints()
            } else {
               return calculateSelfPickPoints()
            }
        }
    }

    // is dealer self-pick
    func calculateDealerSelfPickPoints() -> Points {
        return Points(first: 4000, second: 0)
    }
    
    // is dealer discard
    func calculateDealerDiscardPoints() -> Points {
        return Points(first: 12000, second: 0)
    }
    
    // not dealer self-pick
    func calculateSelfPickPoints() -> Points {
        return  Points(first: 4000, second: 2000)
    }
    
    // is dealer discard
    func calculateDiscardPoints() -> Points {
        return  Points(first: 8000, second: 0)
    }
}

class Points: NSObject {
    let first: Int
    let second: Int?
    
    init() {
        self.first = 0
        self.second = 0
    }
    
    init(first: Int, second: Int?) {
        self.first = first
        self.second = second
    }
}
