//
//  Points.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/11/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

struct Yaku {
    let fan: Int
    let fu: Int
}

enum WinType {
    case SelfPick, Discard
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
    
    class func calculatePoints(yaku: Yaku, winType: WinType) -> Points {
        switch winType {
        case .SelfPick:
            switch yaku.fan {
            case 5:
                return Points(first: 4000, second: 2000)
            default:
                return Points()
            }
        case .Discard:
            return Points(first: 8000, second: 0)
        }
    }

}
