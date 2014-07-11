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
    var currentGameIndex: Int = 0
    
    class func sharedController() -> GameManager {
    struct Singleton {
        static let instance = GameManager()
        }
        return Singleton.instance
    }
    
    init() {
    }
    
    func startGame(game: Game) {
        games += game
    }
    
    func nextGame(game: Game) {
        currentGameIndex++
        startGame(game)
    }
    
    func finishGame(game: Game) {
        // 点数計算処理
    }
}
