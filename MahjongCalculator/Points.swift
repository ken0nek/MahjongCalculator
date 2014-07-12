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
    
    init(_ first: Int, _ second: Int?) {
        self.first = first
        self.second = second
    }
    
    func finalizePoints() -> Points {
        return Points(first.finalize(), second?.finalize())
    }
    
    func description() {
        println("Points : \n" + "\t first : \(first) \n" + "\t second : \(second) \n" + "\t sum : \(sum())")
    }
    
    func sum() -> Int {
        
        var sumValue: Int = first
        
        if second {
            sumValue += second! * 2
        }
        
        return sumValue
    }
}
 
extension Int {
    
    func finalize() -> Int {
        if(self % 100 == 0){
            return self
        }else{
            return ((self / 100) + 1) * 100
        }
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
    
    init(_ fan: Int, _ fu: Int) {
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
        
        output.description
        
        return output
    }
    
    // basePoints
    
    // is dealer self-draw
    func calculateDealerSelfDrawPoints() -> Points {
        
        if (fan == 3 && fu >= 70) ||  (fan == 4 && fu >= 40) || fan == 5 {
            return Points(4000, nil)
        } else if fan == 6 || fan == 7 {
            return Points(6000, nil)
        } else if fan == 8 || fan == 9 || fan == 10 {
            return Points(8000, nil)
        } else if fan == 11 || fan == 12 {
            return Points(12000, nil)
        } else if fan >= 13 {
            return Points(16000, nil)
        } else {
            return Points(basePoints * 2, nil).finalizePoints()
        }
    }
    
    // is dealer discard
    func calculateDealerDiscardPoints() -> Points {
        
        if (fan == 3 && fu >= 70) ||  (fan == 4 && fu >= 40) || fan == 5 {
            return Points(12000, nil)
        } else if fan == 6 || fan == 7 {
            return Points(18000, nil)
        } else if fan == 8 || fan == 9 || fan == 10 {
            return Points(24000, nil)
        } else if fan == 11 || fan == 12 {
            return Points(36000, nil)
        } else if fan >= 13 {
            return Points(48000, nil)
        } else {
            return Points(basePoints * 6, nil).finalizePoints()
        }
    }
    
    // not dealer self-draw
    func calculateSelfDrawPoints() -> Points {
        
        if (fan == 3 && fu >= 70) ||  (fan == 4 && fu >= 40) || fan == 5 {
            return Points(4000, 2000)
        } else if fan == 6 || fan == 7 {
            return Points(6000, 3000)
        } else if fan == 8 || fan == 9 || fan == 10 {
            return Points(8000, 4000)
        } else if fan == 11 || fan == 12 {
            return Points(12000, 6000)
        } else if fan >= 13 {
            return Points(16000, 8000)
        } else {
            return Points(basePoints * 2, basePoints).finalizePoints()
        }
    }
    
    // not dealer discard
    func calculateDiscardPoints() -> Points {
        
        if (fan == 3 && fu >= 70) ||  (fan == 4 && fu >= 40) || fan == 5 {
            return Points(8000, nil)
        } else if fan == 6 || fan == 7 {
            return Points(12000, nil)
        } else if fan == 8 || fan == 9 || fan == 10 {
            return Points(16000, nil)
        } else if fan == 11 || fan == 12 {
            return Points(24000, nil)
        } else if fan >= 13 {
            return Points(36000, nil)
        } else {
            return Points(basePoints * 4, nil).finalizePoints()
        }
    }
}
