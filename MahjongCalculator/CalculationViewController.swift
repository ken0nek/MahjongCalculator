//
//  CalculationViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/11/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

//enum Fu {
//    case 0, 20, 25, 30, 40, 50, 60, 70, 80, 90, 100, 110
//    
//    func aaa() {
//        
//    }
//}
//
//enum Fan {
//    
//}

class CalculationViewController: BaseViewController {

    let gameManager = GameManager.sharedManager()
    
    let fanArray = ["0", "1", "2", "3", "4", "満貫", "跳満", "倍満", "3倍満", "役満"]
    let fuArray = ["0", "20", "25", "30", "40", "50", "60", "70", "80", "90", "100", "110"]
    
    var fan: Int = 0
    var fu: Int = 0
    
    @IBOutlet var fanStepper: UIStepper
    @IBOutlet var fuStepper: UIStepper
    
    @IBOutlet var fanLabel: UILabel
    @IBOutlet var fuLabel: UILabel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didPressRegisterButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didPressStepper(stepper: UIStepper) {
        
        // min, max
        
        if stepper.tag == 1 {
            fanLabel.text = fanArray[Int(Float(stepper.value))]
        } else {
            fuLabel.text = fuArray[Int(Float(stepper.value))]
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
