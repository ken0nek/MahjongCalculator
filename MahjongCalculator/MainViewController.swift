//
//  MainViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: BaseViewController {
    
    @IBOutlet var pointLabel1: UILabel
    @IBOutlet var pointLabel2: UILabel
    @IBOutlet var pointLabel3: UILabel
    @IBOutlet var pointLabel4: UILabel
    
    @IBOutlet var nameLabel1: UILabel
    @IBOutlet var nameLabel2: UILabel
    @IBOutlet var nameLabel3: UILabel
    @IBOutlet var nameLabel4: UILabel
    
    @IBOutlet var tempaiButton1: UIButton
    @IBOutlet var tempaiButton2: UIButton
    @IBOutlet var tempaiButton3: UIButton
    @IBOutlet var tempaiButton4: UIButton
    
    var pointLabels = [UILabel]()
    var nameLabels = [UILabel]()
    var tempaiButtons = [UIButton]()
    
    @IBOutlet var gameLabel: UILabel
    @IBOutlet var honbaLabel: UILabel
    
    var audioPlayer = AVAudioPlayer()
    
    let gameManager = GameManager.sharedManager()
    // let game = GameManager.sharedManager().games[GameManager.sharedManager().currentGameIndex]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tommy = Player(playerID: 0, playerName: "とみ", feng: Feng.East)
        let fukkun = Player(playerID: 1, playerName: "ふく", feng: Feng.South)
        let yoshi = Player(playerID: 2, playerName: "よし", feng: Feng.West)
        let fukudy = Player(playerID: 3, playerName: "でぃ", feng: Feng.North)
        
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
        
        tempaiButtons += tempaiButton1
        tempaiButtons += tempaiButton2
        tempaiButtons += tempaiButton3
        tempaiButtons += tempaiButton4
        
        for pointLabel in pointLabels {
            let player = game.players[pointLabel.tag-1] as Player
            pointLabel.text = "\(player.playerPoints)"
            rotateView(pointLabel)
        }
        
        for nameLabel in nameLabels {
            let player = game.players[nameLabel.tag-1] as Player
            nameLabel.text = player.feng.toString() + " " + player.playerName
            rotateView(nameLabel)
        }
        
        for tempaiButton in tempaiButtons {
            rotateView(tempaiButton)
        }
        
        gameLabel.text = game.round.toString() + game.hand.toString()
        honbaLabel.text = game.honba.toString()
        
        setFengAndPlayerName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)  {
        super.viewWillAppear(animated)
        
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        
        for pointLabel in pointLabels {
            let player = game.players[pointLabel.tag - 1] as Player
            pointLabel.text = "\(player.playerPoints)"
        }
        
        gameLabel.text = game.round.toString() + game.hand.toString()
        honbaLabel.text = game.honba.toString()
    }
    
    func rotateView(var view: UIView) {
        view.transform = CGAffineTransformMakeRotation(Double(-1 * M_PI_2 * Double(view.tag - 1)))
    }
    
    @IBAction func goForward() {
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        game.forwardGame()
        gameLabel.text = game.round.toString() + game.hand.toString()
        
        setFengAndPlayerName()
        
        honbaLabel.text = game.honba.toString()
    }
    
    
    func setFengAndPlayerName() {
        
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        
        for nameLabel in nameLabels {
            let player = game.players[nameLabel.tag-1] as Player
            
            let fengString = NSMutableAttributedString(string: player.feng.toString())
            if player.feng == Feng.East {
                fengString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, 1))
            }
            
            let playerNameString = NSAttributedString(string: player.playerName)
            
            fengString.appendAttributedString(playerNameString)
            
            nameLabel.attributedText = fengString
        }

    }
    
    @IBAction func continueGame() {
        let game = gameManager.games[gameManager.currentGameIndex] as Game
        game.continueGame()
        honbaLabel.text = game.honba.toString()
    }
    
    @IBAction func didPressRichiButton(button: UIButton) {
        let path = NSBundle.mainBundle().pathForResource("tommy", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path)
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
        audioPlayer.currentTime = 0.8
        audioPlayer.prepareToPlay()
        audioPlayer.play()
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
