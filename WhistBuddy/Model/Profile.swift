//
//  Profile.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import Foundation


struct Profile {
    var playerCount: PlayerCount = PlayerCount.six
    var gameMode: GameMode = GameMode.standard
    var prefersBonus: Bool = true
    var bonusValue: Int = 5
    var currentRound: Int = 0
    var gameHands: [Hand] = [Hand.one]
    var playerNames: [String] = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6"]
    var replayRound: Bool = false

    static var defaultNames: [String] = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6"]

    static let `default` = Profile()

    enum GameMode: String, CaseIterable, Identifiable {
        case standard = "1..8..1"
        case inversed = "8..1..8"
        
        var id: String { rawValue }
    }

    enum PlayerCount: Int, CaseIterable, Identifiable {
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        
        var id: Int { rawValue }
    }
    
    mutating func initGameHands() {
        let startValue:Hand = gameMode == GameMode.standard ?  Hand.one : Hand.eight
        let endValue:Hand = gameMode == GameMode.standard ? Hand.eight : Hand.one
        
        gameHands = Array(repeating: startValue, count: playerCount.rawValue - 1)
        gameHands.append(contentsOf: gameMode == GameMode.standard ? Hand.allCases : Hand.allCases.reversed())
        gameHands.append(contentsOf: Array(repeating: endValue, count: playerCount.rawValue - 2 ))
        gameHands.append(contentsOf: gameMode == GameMode.standard ? Hand.allCases.reversed() : Hand.allCases)
        gameHands.append(contentsOf: Array(repeating: startValue, count: playerCount.rawValue - 1))

    }
        
}
