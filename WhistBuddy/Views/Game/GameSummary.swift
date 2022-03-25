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
                HStack {
                    ForEach(modelData.rounds) { round in
                        RoundList(round: round, playerCount: modelData.profile.playerCount, currentRound: modelData.profile.currentRound)
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
