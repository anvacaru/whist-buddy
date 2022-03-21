//
//  GameEntry.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct GameEntry: View {
    var profile: Profile
    var rounds: [Round]
    var playerIndex:Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:.center, spacing: 0) {
                Text(profile.playerNames[playerIndex])
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                Divider()
                ForEach(1...profile.currentRound + 1, id:\.self) { idx in
                    RoundEntry(round: rounds[idx - 1], playerIndex: playerIndex)
                        .padding()
                }
            }
        }
    }
}

struct GameEntry_Previews: PreviewProvider {
    static var previews: some View {
        GameEntry(profile: Profile.default, rounds: [Round.default], playerIndex: 0)
            .environmentObject(ModelData())
    }
}
