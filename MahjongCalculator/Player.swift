//
//  Player.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

enum Feng {
    case East, South, West, North
    
    func toString() -> String {
        switch self {
        case .East: return "東"
        case .South: return "南"
        case .West: return "西"
        case .North: return "北"
        }
    }
    
    mutating func next() {
        switch self {
        case .East:
            self = South
        case .South:
            self = West
        case .West:
            self = North
        case .North:
            self = East
        }
    }
}

class Player: NSObject {
    let playerID: Int
    var playerName: String
    var isDealer: Bool
    var playerPoints: Int
    var feng: Feng
    
    // let gameManager: GameManager = GameManager.sharedManager()
    
    init(playerID: Int, playerName: String, isDealer: Bool, playerPoints: Int, feng: Feng) {
        self.playerID = playerID
        self.playerName = playerName
        self.isDealer = isDealer
        self.playerPoints = playerPoints
        self.feng = feng
    }
    
    convenience init(playerID: Int, playerName: String, isDealer: Bool, feng: Feng) {
        self.init(playerID: playerID, playerName: playerName, isDealer: isDealer, playerPoints: 25000, feng: feng)
    }
    
    func win(targetPlayer: Player?, _ yaku: Yaku) {
        let points = yaku.calculatePoints(self, targetPlayer: targetPlayer)
        if targetPlayer { // win on self-draw
            playerPoints += points.first
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
    
//    func otherPlayers() -> [Player] {
//        let game =  gameManager.games[gameManager.currentGameIndex] as Game
//        var allPlayers = game.players
//        // let otherPlayers = allPlayers.removeAtIndex(1) as [Player]
//        
//        return [Player]()
//    }
}
