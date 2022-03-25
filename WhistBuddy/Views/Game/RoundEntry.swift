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
    var awarded: Bool = false
    var deprived: Bool = false
    var body: some View {
        HStack {
            VStack {
                if(round.bids[playerIndex] == round.results[playerIndex] || round.id == currentRound) {
                    Text(String(round.bids[playerIndex].rawValue))
                        .frame(width: 25, height: 25)
                } else {
                    Text(String(round.bids[playerIndex].rawValue)).strikethrough()
                        .frame(width: 25, height: 25)
                }
                Text(String(round.results[playerIndex].rawValue))
                    .frame(width: 25, height: 25)
            }
            Text(String(round.scores[playerIndex]))
                .frame(width: 25, height: 25)
                .border(awarded ? .green : deprived ? .red : .clear)
        }
    }
}

struct RoundEntry_Previews: PreviewProvider {
    static var previews: some View {
        RoundEntry(round: Round.default, playerIndex: 0, currentRound: 1, awarded: true)
            .environmentObject(ModelData())
    }
}
