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
    
    @IBOutlet var fanStepper: UIStepper
    @IBOutlet var fuStepper: UIStepper
    
    @IBOutlet var fanLabel: UILabel
    @IBOutlet var fuLabel: UILabel
    
    @IBOutlet var winTypeSegment: UISegmentedControl
    
    @IBOutlet var winPlayerSegment: UISegmentedControl
    @IBOutlet var targetPlayerSegment: UISegmentedControl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        fanLabel.text = fanArray[0]
        fanStepper.maximumValue = CGFloat(fanArray.count) - 1
        
        fuLabel.text = fuArray[0]
        fuStepper.maximumValue = CGFloat(fuArray.count) - 1
        
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        setPlayersName(winPlayerSegment, game.players)
        
        controlTargetPlayerSegmentTitle(winPlayerSegment)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didPressRegisterButton() {
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        
        let winPlayer = game.players[winPlayerSegment.selectedSegmentIndex] as Player
        
        println(winPlayer.isDealer)
        
        var targetPlayer: Player?
        if winTypeSegment.selectedSegmentIndex == 1 {
            targetPlayer = nil
        } else {
            targetPlayer = otherPlayers[targetPlayerSegment.selectedSegmentIndex]
        }
        
        let yaku = Yaku(fan, fu)
        
        game.deal(winPlayer, targetPlayer, yaku)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didPressStepper(stepper: UIStepper) {
        
        let index = Int(CGFloat(stepper.value))
        
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
        } else {
            fuLabel.text = fuArray[index]
            fu = fuArray[index].toInt()!
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
