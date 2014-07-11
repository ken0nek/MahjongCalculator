 //
//  Points.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/11/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

//enum WinType {
//    case SelfDraw, Discard
//}

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
    
    func finalizePoints() -> Points {
        return Points(first: self.first.finalize(), second: self.second?.finalize())
    }
}
 
extension Int {
    func finalize() -> Int {
        let numberValue = Float(self) /  powf(Float(10), Float((self.digits() - 2)))
        let output = Int(ceil(numberValue)) * Int(powf(Float(10), Float((self.digits() - 2))))
        return output
    }
    
    // not use log
    func digits() -> Int {
        var count: Int = 0
        var number: Int = self
        while number > 0 {
            number /= 10;
            count++;
        }
        
        return count
    }
}

struct Yaku {
    let fan: Int
    let fu: Int
    // 子のツモ和了が発生した時に、他の子が支払う点数
    var basePoints: Int {
    get {
        return Int(powf(Float(2), Float(fan + 2)) * Float(fu))
    }
    }
    
    init() {
        self.fan = 0
        self.fu = 0
    }
    
    init(fan: Int, fu: Int) {
        self.fan = fan
        self.fu = fu
    }
    
    func calculatePoints(winPlayer: Player, targetPlayer: Player?) -> Points {
        
        var output = Points()
        
        if winPlayer.isDealer {
            if targetPlayer {
                output = calculateDealerDiscardPoints()
            } else {
                output = calculateDealerSelfDrawPoints()
            }
        } else {
            if targetPlayer {
                output = calculateDiscardPoints()
            } else {
                output = calculateSelfDrawPoints()
            }
        }
        
        println("output : \n" + "\t first : \(output.first) \n" + "\t second : \(output.second)")
        
        return output
    }
    
    // basePoints
    
    // is dealer self-draw
    func calculateDealerSelfDrawPoints() -> Points {
        
        return Points(first: self.basePoints * 2, second: 0).finalizePoints()
    }
    
    // is dealer discard
    func calculateDealerDiscardPoints() -> Points {
        
        return Points(first: self.basePoints * 6, second: 0).finalizePoints()
    }
    
    // not dealer self-draw
    func calculateSelfDrawPoints() -> Points {
        
        return  Points(first: self.basePoints * 2, second: self.basePoints).finalizePoints()
    }
    
    // not dealer discard
    func calculateDiscardPoints() -> Points {
        
        return  Points(first: self.basePoints * 4, second: 0).finalizePoints()
    }
}
