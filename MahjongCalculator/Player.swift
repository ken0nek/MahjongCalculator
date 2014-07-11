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
    
    func winOnSelfDraw(points: Points) {
        self.playerPoints += points.first
        let otherPlayers = [Player]()
    }
    
    func winOnDiscard(targetPlayer: Player, points: Points) {
        self.playerPoints += points.first
        targetPlayer.playerPoints -= points.first
    }
    
    func otherPlayers() -> [Player] {
        let game =  gameManager.games[gameManager.currentGameIndex] as Game
        var allPlayers = game.players
        // let otherPlayers = allPlayers.removeAtIndex(1) as [Player]
        
        return otherPlayers
    }
}
