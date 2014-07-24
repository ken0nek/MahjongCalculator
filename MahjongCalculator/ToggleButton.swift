//
//  ToggleButton.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/24/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class ToggleButton: UIButton {
    var isToggled: Bool
    
    init(frame: CGRect) {
        isToggled = false
        super.init(frame: frame);
    }
    
    func setToggled(toggled: Bool) {
        
        isToggled = toggled
        
        if toggled {
            self.backgroundColor = UIColor.yellowColor()
            setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        } else {
            self.backgroundColor = UIColor.whiteColor()
            setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        }
    }
}
