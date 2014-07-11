//
//  Player.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class Player: NSObject {
    var playerID: Int
    var playerName: String
    var isDealer: Bool
    var playerPoints: Int
    let gameManager: GameManager = GameManager.sharedManager()
    
    init(playerID: Int, playerName: String, isDealer: Bool, playerPoints: Int) {
        self.playerID = playerID
        self.playerName = playerName
        self.isDealer = false
        self.playerPoints = playerPoints
    }
    
    convenience init(playerID: Int, playerName: String, isDealer: Bool) {
        self.init(playerID: playerID, playerName: playerName, isDealer: isDealer, playerPoints: 25000)
    }
    
    func win(targetPlayer: Player?, _ yaku: Yaku) {
        let points = yaku.calculatePoints(self, targetPlayer: targetPlayer)
        if targetPlayer {
            self.playerPoints += points.first
            targetPlayer!.playerPoints -= points.first
        } else {
            
        }
    }
    
//    func winOnSelfDraw(yaku: Yaku) {
//        let points = yaku.calculatePointsWithPlayer(self, WithWinType: WinType.Discard)
//        
//        // まず自分が親かどうか。
//        // 親だったら、
////        self.playerPoints += points.first
////        let otherPlayers = self.otherPlayers()
////        for otherPlayer in otherPlayers {
////            otherPlayer.playerPoints -= points.first
////        }
//    }
//    
//    func winOnDiscard(targetPlayer: Player?, _ yaku: Yaku) {
//        let points = yaku.calculatePointsWithPlayer(self, WithWinType: WinType.Discard)
//        
//        
//    }
    
    func otherPlayers() -> [Player] {
        let game =  gameManager.games[gameManager.currentGameIndex] as Game
        var allPlayers = game.players
        // let otherPlayers = allPlayers.removeAtIndex(1) as [Player]
        
        return [Player]()
    }
}
