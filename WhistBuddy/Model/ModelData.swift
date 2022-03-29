//
//  ModelData.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var profile = Profile.default
    @Published var rounds = [Round.default]
    @Published var players = Player.initPlayers(playerNames: Profile.defaultNames, playerCount: Profile.PlayerCount.six)
    @Published var hasBids: Bool = false
    @Published var hasResults: Bool = false
    @Published var gameState: GameState = GameState.notInitialized

    enum GameState: Int, CaseIterable, Identifiable {
        case notInitialized = 0
        case inProgress = 1
        case finished = 2

        var id: Int {rawValue}
    }
    
    func updatePlayerScores(round: Round) {
        var roundPoints: Int = 0
        let countStreak: Bool = (round.hand != Hand.one) && profile.prefersBonus

        for idx in 0..<profile.playerCount.rawValue {
            if round.bids[idx] == round.results[idx] {
                roundPoints = 5 + round.bids[idx].rawValue
            } else {
                roundPoints = abs(round.bids[idx].rawValue - round.results[idx].rawValue) * (-1)
            }
            players[idx].updateScore(roundPoints: roundPoints, countStreak: countStreak, bonusValue: profile.bonusValue, roundId: round.id)
        }
    }
    
    func checkForGameEnd() {
        if profile.currentRound == profile.gameHands.count {
            gameState = ModelData.GameState.finished
        }
    }
    
}
