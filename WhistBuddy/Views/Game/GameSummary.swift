//
//  GameSummary.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct GameSummary: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        HStack(alignment: .top) {
            PlayerList(players: modelData.players)
                .padding(.leading)
                .frame(maxWidth: 100)
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment:.top) {
                    ForEach(modelData.rounds.filter({$0.id <= modelData.profile.currentRound}).reversed()) { round in
                        RoundList(round: round, players:modelData.players, currentRound: modelData.profile.currentRound, displayBid: (modelData.hasBids || modelData.profile.currentRound > round.id), displayScore: modelData.profile.currentRound > round.id)
                        Divider()
                    }
                }
            }
        }
    }
}

struct GameSummary_Previews: PreviewProvider {
    static var previews: some View {
        GameSummary()
            .environmentObject(ModelData())
    }
}
