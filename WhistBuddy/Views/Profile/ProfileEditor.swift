//
//  GameEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var body: some View {
        VStack {
            Text("Game Rules")
                .font(.title)
                .bold()
            List {
                GameModeEditor(gameMode: $profile.gameMode)
                StreakBonusEditor(prefersBonus: $profile.prefersBonus)
                if(profile.prefersBonus) {
                    StreakBonusValueEditor(bonusValue: $profile.bonusValue)
                }
                ReplayRoundEditor(replayRound: $profile.replayRound)
                PlayerCountEditor(playerCount:$profile.playerCount)
                PlayerNamesEditor(playerCount: profile.playerCount, playerNames: $profile.playerNames)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
