//
//  MainViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var label1: UILabel
    @IBOutlet var label2: UILabel
    @IBOutlet var label3: UILabel
    @IBOutlet var label4: UILabel


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        rotateLabels(label1)
        rotateLabels(label2)
        rotateLabels(label3)
        rotateLabels(label4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func rotateLabels(var label: UILabel) {
        label.transform = CGAffineTransformMakeRotation(CGFloat(-1 * M_PI_2 * Double(label.tag - 1)))
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
