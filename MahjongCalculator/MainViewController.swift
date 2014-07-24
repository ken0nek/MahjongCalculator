//
//  MainViewController.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit
import AVFoundation

extension CGPoint {
    func addition(point: CGPoint) -> CGPoint {
        return CGPointMake(self.x + point.x, self.y + point.y)
    }
}

class MainViewController: BaseViewController {
    
    @IBOutlet var gameLabel: UILabel
    @IBOutlet var honbaLabel: UILabel
    @IBOutlet var poolPointsLabel: UILabel
    
    var pointLabels = [UILabel]()
    var fengAndNameLabels = [UILabel]()
    
    var audioPlayer = AVAudioPlayer()
    
    let gameManager = GameManager.sharedManager()
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tommy = Player(playerID: 0, playerName: "とみ", feng: Feng.East)
        let fukkun = Player(playerID: 1, playerName: "ふく", feng: Feng.South)
        let yoshi = Player(playerID: 2, playerName: "よし", feng: Feng.West)
        let fukudy = Player(playerID: 3, playerName: "でぃ", feng: Feng.North)
        
        var players = [tommy, fukkun, yoshi, fukudy]
        
        gameManager.startGame(Game(players, 0))
        game = gameManager.currentGame
        
        displayObjects()
        
        setFengAndPlayerName()
        
        gameLabel.text = game.round.toString() + game.hand.toString()
        honbaLabel.text = game.honba.toString()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)  {
        super.viewWillAppear(animated)
        
        for pointLabel in pointLabels {
            let player = game.players[pointLabel.tag - 1] as Player
            pointLabel.text = "\(player.playerPoints)" + " " + "\(player.playerChips)"
        }
        
        gameLabel.text = game.round.toString() + game.hand.toString()
        honbaLabel.text = game.honba.toString()
    }
    
    func displayObjects() {
        let centerPoint = CGPointMake(320/2, 568/2)
        let radiusArray: [Int] = [60, 85, 110, 135]
        var positionArray: [[CGPoint]] = [
            [CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0)],
            [CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0)],
            [CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0)],
            [CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0)]]
        
        for var ri: Int = 0; ri < 4; ri++ { // radius
            for var dj: Int = 0; dj < 4; dj++ { // degree
                let point = CGPoint(x: radiusArray[ri] * Int(sinf(Float(M_PI_2) * Float(dj))), y: radiusArray[ri] * Int(cosf(Float(M_PI_2) * Float(dj))))
                positionArray[ri][dj] = centerPoint.addition(point)
                // viewWithPosition WithNumber
                if ri == 0 { // fishing
                    let fishingButton = ToggleButton.buttonWithType(UIButtonType.Custom) as UIButton
                    fishingButton.frame = CGRectMake(0, 0, 80, 20)
                    fishingButton.tag = dj + 1
                    fishingButton.center = positionArray[ri][dj]
                    fishingButton.setTitle("リーチ", forState: UIControlState.Normal)
                    fishingButton.setTitle("リーチ!", forState: UIControlState.Highlighted)
                    fishingButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                    fishingButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
                    fishingButton.titleLabel.font = UIFont.boldSystemFontOfSize(15)
                    fishingButton.titleLabel.textAlignment = NSTextAlignment.Center
                    fishingButton.addTarget(self, action: Selector("didPressFishingButton:"), forControlEvents: UIControlEvents.TouchUpInside)
                    rotateView(fishingButton)
                    self.view.addSubview(fishingButton)
                } else if ri == 1 { // feng + name
                    let fengAndNameLabel = UILabel(frame: CGRectMake(0, 0, 80, 20))
                    fengAndNameLabel.tag = dj + 1
                    fengAndNameLabel.center = positionArray[ri][dj]
                    fengAndNameLabel.textAlignment = NSTextAlignment.Center
                    fengAndNameLabel.font = UIFont.boldSystemFontOfSize(20)
                    let player = game.players[dj] as Player
                    fengAndNameLabel.text = player.feng.toString() + " " + player.playerName
                    rotateView(fengAndNameLabel)
                    self.view.addSubview(fengAndNameLabel)
                    fengAndNameLabels += fengAndNameLabel
                } else if ri == 2 { // points + chips
                    let pointLabel = UILabel(frame: CGRectMake(0, 0, 100, 20))
                    pointLabel.tag = dj + 1
                    pointLabel.center = positionArray[ri][dj]
                    pointLabel.textAlignment = NSTextAlignment.Center
                    pointLabel.font = UIFont.boldSystemFontOfSize(20)
                    let player = game.players[dj] as Player
                    pointLabel.text = "\(player.playerPoints)" + " " + "\(player.playerChips)"
                    rotateView(pointLabel)
                    self.view.addSubview(pointLabel)
                    pointLabels += pointLabel
                } else { // win
                    let winButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
                    winButton.frame = CGRectMake(0, 0, 80, 20)
                    winButton.tag = dj + 1
                    winButton.center = positionArray[ri][dj]
                    winButton.setTitle("和了", forState: UIControlState.Normal)
                    winButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
                    winButton.titleLabel.font = UIFont.boldSystemFontOfSize(15)
                    winButton.titleLabel.textAlignment = NSTextAlignment.Center
                    winButton.addTarget(self, action: Selector("didPressWinButton:"), forControlEvents: UIControlEvents.TouchUpInside)
                    rotateView(winButton)
                    self.view.addSubview(winButton)
                }
            }
        }
    }
    
    func rotateView(var view: UIView) {
        view.transform = CGAffineTransformRotate(view.transform, CGFloat(-1 * M_PI_2 * Double(view.tag - 1)))
    }
    
//    @IBAction func goForward() {
//        game.forwardGame()
//        gameLabel.text = game.round.toString() + game.hand.toString()
//        
//        setFengAndPlayerName()
//        
//        honbaLabel.text = game.honba.toString()
//    }
    
    func setFengAndPlayerName() {
        
        for fengAndNameLabel in fengAndNameLabels {
            let player = game.players[fengAndNameLabel.tag - 1] as Player
            
            let fengString = NSMutableAttributedString(string: player.feng.toString())
            if player.feng == Feng.East {
                fengString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, 1))
            }
            
            let playerNameString = NSAttributedString(string: player.playerName)
            
            fengString.appendAttributedString(playerNameString)
            
            fengAndNameLabel.attributedText = fengString
        }

    }
    
//    @IBAction func continueGame() {
//        game.continueGame()
//        honbaLabel.text = game.honba.toString()
//    }
    
    func didPressFishingButton(button: ToggleButton) {
        if button.isToggled {
            button.setToggled(false)
        } else {
            let path = NSBundle.mainBundle().pathForResource("tommy", ofType: "mp3")
            let url = NSURL(fileURLWithPath: path)
            audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            audioPlayer.currentTime = 0.8
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            button.setToggled(true)
        }
    }
    
    func didPressWinButton(button: UIButton) {
        gameManager.winPlayerIndex = button.tag - 1
        let cVC = storyboard.instantiateViewControllerWithIdentifier("Calculation") as CalculationViewController
        self.navigationController.pushViewController(cVC, animated: true)
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
