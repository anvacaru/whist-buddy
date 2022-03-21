//
//  Round.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import Foundation

struct Round: Identifiable {
    var id: Int
    var hand: Hand = Hand.one
    var bids: [Bid]
    var results: [Bid]
    var scores: [Int]
    
    static let `default` = Round(id: 0, playerCount: Profile.PlayerCount.six, hand: Hand.one)

    
    enum Bid: Int, CaseIterable, Identifiable {
        case zero = 0
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        
        var id: Int { rawValue }
    }
    
    init(id: Int, playerCount: Profile.PlayerCount, hand: Hand) {
        self.id = id
        self.hand = hand
        self.bids = Array(repeating: Bid.zero, count: playerCount.rawValue)
        self.results = Array(repeating: Bid.zero, count: playerCount.rawValue)
        self.scores = Array(repeating: 0, count: playerCount.rawValue)
    }
    
    func validateBids() -> Bool {
        var sum:Int = 0
        if (bids.first(where: { $0.rawValue > hand.rawValue}) != nil) {
            return false
        }
        for item in bids {
            sum += item.rawValue
        }
        return sum != hand.rawValue
    }
    
    func validateResults() -> Bool {
        var sum:Int = 0
        for item in results {
            sum += item.rawValue
        }
        return sum == hand.rawValue
    }
    
    mutating func computeScore(previousScores: [Int]) -> [Int]{
        for idx in 0..<bids.count {
            if bids[idx] == results[idx] {
                scores[idx] = previousScores[idx] + 5 + bids[idx].rawValue
            } else {
                scores[idx] = previousScores[idx] - abs(bids[idx].rawValue - results[idx].rawValue)
            }
        }
        return scores
    }
    
    static func initGameRounds(playerCount: Profile.PlayerCount, gameHands: [Hand]) -> [Round] {
        var counter: Int = 0
        var rounds: [Round] = []
        for item in gameHands {
            rounds.append(Round(id: counter, playerCount: playerCount, hand: item))
            counter += 1
        }
        return rounds
    }
}
