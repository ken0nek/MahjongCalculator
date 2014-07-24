//
//  SettingViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/18/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    @IBOutlet var rateStepper: UIStepper
    @IBOutlet var uma1Stepper: UIStepper
    @IBOutlet var uma2Stepper: UIStepper
    @IBOutlet var okaStepper: UIStepper
    
    @IBOutlet var rateLabel: UILabel
    @IBOutlet var uma1Label: UILabel
    @IBOutlet var uma2Label: UILabel
    @IBOutlet var okaLabel: UILabel
    
    let rateArray: [Int] = [1, 2, 3, 5, 10, 20, 50, 100]
    //let umaArray: [Int] = [0, 5, 310, 5, 10, 20, 50, 100]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rateStepper.maximumValue = Double(rateArray.count - 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressStepper(stepper: UIStepper) {
        
        let index = Int((stepper.value) as Double)
        
        switch stepper.tag {
        case 1:
             rateLabel.text = "\(rateArray[index])"
        case 2:
            uma1Label.text = "\(index * 5)"
        case 3:
            uma2Label.text = "\(index * 5)"
        case 4:
            okaLabel.text = "\(index * 1000)"
        default:
            break
        }
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
