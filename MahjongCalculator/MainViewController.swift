//
//  MainViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet var label1: UILabel
    @IBOutlet var label2: UILabel
    @IBOutlet var label3: UILabel
    @IBOutlet var label4: UILabel
    var labels = [UILabel]()

    @IBOutlet var gameLabel: UILabel
    let gameManager: GameManager = GameManager.sharedController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var players =
            [Player(playerID: 0, playerName: "とみ", isDealer: true),
            Player(playerID: 1, playerName: "ふく", isDealer: false),
            Player(playerID: 2, playerName: "よし", isDealer: false),
            Player(playerID: 3, playerName: "でぃ", isDealer: false)]
        
        
        gameManager.startGame(Game(players: players))
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        
        gameLabel.text = game.round.toString() + game.hand.toString()
     
        labels += label1
        labels += label2
        labels += label3
        labels += label4
        
        for label in labels {
            let player = game.players[label.tag-Int(1)] as Player
            label.text = "\(player.playerPoints)"
            rotateLabel(label)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotateLabel(var label: UILabel) {
        label.transform = CGAffineTransformMakeRotation(CGFloat(-1 * M_PI_2 * Double(label.tag - 1)))
    }
    
    @IBAction func goForward() {
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        game.nextHand()
        gameLabel.text = game.round.toString() + game.hand.toString()
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
