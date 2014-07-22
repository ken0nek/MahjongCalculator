//
//  CalculationViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/11/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class CalculationViewController: BaseViewController {

    let gameManager = GameManager.sharedManager()
    
    let fanArray = ["1", "2", "3", "4", "満貫", "跳満", "倍満", "3倍満", "役満"]
    let fuArray = ["20", "25", "30", "40", "50", "60", "70", "80", "90", "100", "110"]
    var otherPlayers = [Player]()
    
    var fan: Int = 1
    var fu: Int = 20
    var chips: Int = 0
    
    @IBOutlet var fanStepper: UIStepper
    @IBOutlet var fuStepper: UIStepper
    @IBOutlet var chipsStepper: UIStepper
    
    @IBOutlet var fanLabel: UILabel
    @IBOutlet var fuLabel: UILabel
    @IBOutlet var chipsLabel: UILabel
    
    @IBOutlet var winTypeSegment: UISegmentedControl
    
    @IBOutlet var winPlayerSegment: UISegmentedControl
    @IBOutlet var targetPlayerSegment: UISegmentedControl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        fanLabel.text = fanArray[0]
        fanStepper.maximumValue = Double((fanArray.count - 1))

        
        fuLabel.text = fuArray[0]
        fuStepper.maximumValue = Double((fuArray.count - 1))
        
        chipsLabel.text = "\(chips)"
        
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        setPlayersName(winPlayerSegment, game.players)
        
        controlTargetPlayerSegmentTitle(winPlayerSegment)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton() {
        self.navigationController.popViewControllerAnimated(true)
    }

    @IBAction func didPressRegisterButton() {
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        
        var targetPlayerIndex: Int?
        
        if winTypeSegment.selectedSegmentIndex == 0 {
            targetPlayerIndex = targetPlayerSegment.selectedSegmentIndex
        }
        
        let yaku = Yaku(fan, fu)
        
        game.deal(winPlayerSegment.selectedSegmentIndex, targetPlayerIndex, yaku, chips)

        self.navigationController.popViewControllerAnimated(true)
    }

    @IBAction func didPressStepper(stepper: UIStepper) {
        
        let index = Int((stepper.value) as Double)
        
        if stepper.tag == 1 {
            fanLabel.text = fanArray[index]
            
            switch index {
            case 6: fan = 8
            case 7: fan = 11
            case 8: fan = 13
            default:
                fan = index + 1
            }
            
            if index > 3 {
                fuStepper.alpha = 0
                fuLabel.alpha = 0
            } else {
                fuStepper.alpha = 1
                fuLabel.alpha = 1
            }
        } else if stepper.tag == 2 {
            fuLabel.text = fuArray[index]
            fu = fuArray[index].toInt()!
        } else {
            chips = index
            chipsLabel.text = "\(chips)"
        }
    }
    
    func setPlayersName(segment: UISegmentedControl, _ players: [Player]) {
        for var i: Int = 0; i < players.count; i++ {
            segment.setTitle(players[i].playerName, forSegmentAtIndex: i)
        }
    }
    
    @IBAction func controlTargetPlayerSegmentAlpha(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 1 {
            targetPlayerSegment.alpha = 0
        } else {
            targetPlayerSegment.alpha = 1
        }
    }
    
    @IBAction func controlTargetPlayerSegmentTitle(segment: UISegmentedControl) {
        
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        otherPlayers = game.players
        otherPlayers.removeAtIndex(winPlayerSegment.selectedSegmentIndex)
        
        setPlayersName(targetPlayerSegment, otherPlayers)
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
