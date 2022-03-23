//
//  RoundEntry.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct RoundEntry: View {
    @EnvironmentObject var modelData: ModelData

    var round: Round
    var playerIndex: Int
    var body: some View {
        if (playerIndex < round.results.count){
            HStack {
                VStack {
                    if(round.bids[playerIndex] == round.results[playerIndex]){
                        Text(String(round.bids[playerIndex].rawValue))
                    } else {
                        Text(String(round.bids[playerIndex].rawValue)).strikethrough()
                    }
                    Text(String(round.results[playerIndex].rawValue))
                }
                Text(String(round.scores[playerIndex]))
            }
        }
    }
}

struct RoundEntry_Previews: PreviewProvider {
    static var previews: some View {
        RoundEntry(round: Round.default, playerIndex: 0)
            .environmentObject(ModelData())
    }
}
