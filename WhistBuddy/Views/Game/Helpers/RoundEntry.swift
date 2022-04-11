//
//  RoundEntry.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct RoundEntry: View {

    var round: Round
    var playerIndex: Int
    var currentRound: Int
    var displayBid: Bool
    var displayScore: Bool
    var awarded: Bool = false
    var deprived: Bool = false

    var body: some View {
        HStack {
            VStack {
                if(round.bids[playerIndex] == round.results[playerIndex] || round.id == currentRound) {
                    RoundText(value: round.bids[playerIndex].rawValue, display: displayBid)
                } else {
                    RoundText(value: round.bids[playerIndex].rawValue, display: displayBid, strikethrough: true)
                }
                RoundText(value: round.results[playerIndex].rawValue, display: displayScore)
            }
            RoundText(value: round.scores[playerIndex], display: displayScore, awarded: awarded, deprived: deprived)
        }
    }
}

struct RoundEntry_Previews: PreviewProvider {
    static var previews: some View {
        RoundEntry(round: Round.default, playerIndex: 0, currentRound: 1, displayBid: true, displayScore: true, awarded: true)
            .environmentObject(ModelData())
    }
}
