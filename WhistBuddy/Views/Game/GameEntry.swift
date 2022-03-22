//
//  GameEntry.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct GameEntry: View {
    @EnvironmentObject var modelData: ModelData
    
    var playerIndex:Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:.center, spacing: 0) {
                Text(modelData.players[playerIndex].name)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                Divider()
                ForEach(1...modelData.profile.currentRound + 1, id:\.self) { idx in
                    RoundEntry(round: modelData.rounds[idx - 1], playerIndex: playerIndex)
                        .padding()
                }
            }
        }
    }
}

struct GameEntry_Previews: PreviewProvider {
    static var previews: some View {
        GameEntry(playerIndex: 0)
            .environmentObject(ModelData())
    }
}
