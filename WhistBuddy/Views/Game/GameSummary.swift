//
//  GameSummary.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct GameSummary: View {
    @EnvironmentObject var modelData: ModelData
    var rounds: [Round] = [Round.default]
    
    var body: some View {
        ScrollView {
            GameHead(profile: modelData.profile, playerIndex: 0)
            ForEach(0..<modelData.profile.playerCount.rawValue, id:\.self) { idx in
                GameEntry(playerIndex: idx)
                Divider()
                Spacer()
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
