//
//  GameManager.swift
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/10/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

import UIKit

class GameManager: NSObject {
    
    var games: [Game] = []
    var deals: [Deal] = []
    var currentGameIndex: Int = 0
    var currentDealIndex: Int = 0
    var currentGame: Game {
    get {
        return games[currentGameIndex]
    }
    }
    
    class func sharedManager() -> GameManager {
    struct Singleton {
        static let instance = GameManager()
        }
        return Singleton.instance
    }
    
    init() {
    }
    
    func startGame(game: Game) {
        deals = []
        games += game
    }
    
    func nextGame(game: Game) {
        currentGameIndex++
        startGame(game)
    }
    
    func recordGame(game: Game) {
        let deal = Deal(game)
        deals += deal
        println("deals : " + deals.description)
    }
    
    func finishGame(game: Game) {
        // 点数計算処理
    }
}
