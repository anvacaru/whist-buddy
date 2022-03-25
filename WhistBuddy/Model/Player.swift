//
//  Player.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 22.03.2022.
//

import Foundation

struct Player: Identifiable {
    var id: Int = 0
    var name: String = "Player"
    var score: Int = 0
    var streak: Int = 0
    var awardedIn: [Int] = []
    var deprivedIn: [Int] = []

    static let `default` = Player(id: 0, name: "Player 1", score: 0, streak: 0)
    
    static func initPlayers(playerNames:[String], playerCount: Profile.PlayerCount) -> [Player] {
        var players:[Player] = []
        for id in 0..<playerCount.rawValue {
            players.append(Player(id: id, name: playerNames[id], score: 0, streak: 0))
        }
        return players
    }
    
    mutating func updateScore(roundPoints: Int, countStreak: Bool, bonusValue: Int, roundId: Int) {
        score += roundPoints
        if countStreak {
            if roundPoints > 0 {
                streak = streak >= 0 ? streak + 1 : 1
            } else {
                streak = streak <= 0 ? streak - 1 : -1
            }
        }
        if streak % 5 == 0 && streak != 0 {
            let value = streak > 0 ? bonusValue : (-1) * bonusValue
            score += value
            streak = 0
            if value > 0 {
                awardedIn.append(roundId)
            } else {
                deprivedIn.append(roundId)
            }
        }
    }

    static func sortPlayers(players:[Player]) -> [Player] {
        var standings: [Player] = []
        standings.append(contentsOf:
                            players.filter { $0.score == 0 }
                         )
        standings.append(contentsOf:
                            players
                                .sorted { $0.score >= $1.score }
                                .filter { $0.score != 0 }
                         )
        return standings
    }
}
