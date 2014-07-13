//
//  MainViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet var pointLabel1: UILabel
    @IBOutlet var pointLabel2: UILabel
    @IBOutlet var pointLabel3: UILabel
    @IBOutlet var pointLabel4: UILabel
    
    @IBOutlet var nameLabel1: UILabel
    @IBOutlet var nameLabel2: UILabel
    @IBOutlet var nameLabel3: UILabel
    @IBOutlet var nameLabel4: UILabel
    
    var pointLabels = [UILabel]()
    var nameLabels = [UILabel]()
    var playerLabels = [[UILabel]]()
    
    @IBOutlet var gameLabel: UILabel
    let gameManager = GameManager.sharedManager()
    // let game = GameManager.sharedManager().games[GameManager.sharedManager().currentGameIndex]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // println(Int(11213).finalize())
//
//        let yaku: Yaku = Yaku(1, 30)
//        println(yaku.basePoints)
        
        let tommy = Player(playerID: 0, playerName: "とみ", isDealer: true, feng: Feng.East)
        let fukkun = Player(playerID: 1, playerName: "ふく", isDealer: false, feng: Feng.South)
        let yoshi = Player(playerID: 2, playerName: "よし", isDealer: false, feng: Feng.West)
        let fukudy = Player(playerID: 3, playerName: "でぃ", isDealer: false, feng: Feng.North)
        
        var players = [tommy, fukkun, yoshi, fukudy]
        
        gameManager.startGame(Game(players: players, startingPlayer: players[0]))
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        
        pointLabels += pointLabel1
        pointLabels += pointLabel2
        pointLabels += pointLabel3
        pointLabels += pointLabel4
        
        nameLabels += nameLabel1
        nameLabels += nameLabel2
        nameLabels += nameLabel3
        nameLabels += nameLabel4
        
        game.deal(tommy, nil, Yaku(5))
        //game.deal(fukudy, nil, Yaku(5))
        
        for pointLabel in pointLabels {
            let player = game.players[pointLabel.tag-1] as Player
            pointLabel.text = "\(player.playerPoints)"
            rotateLabel(pointLabel)
        }
        
        for nameLabel in nameLabels {
            let player = game.players[nameLabel.tag-1] as Player
            nameLabel.text = player.feng.toString() + " " + player.playerName
            rotateLabel(nameLabel)
        }
        
        gameLabel.text = game.round.toString() + game.hand.toString()
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
        game.forwardGame()
        gameLabel.text = game.round.toString() + game.hand.toString()
        
        for nameLabel in nameLabels {
            let player = game.players[nameLabel.tag-1] as Player
            nameLabel.text = player.feng.toString() + " " + player.playerName
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
