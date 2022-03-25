//
//  GameSummary.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack() {
                Text("Game Rules")
                    .bold()
                    .font(.title)
                
                HStack() {
                    VStack(alignment: .leading, spacing: 10) {
                        GameMode(gameMode: profile.gameMode)
                        StreakBonus(prefersBonus:profile.prefersBonus, bonusValue: profile.bonusValue)
                        ReplayRound(replayRound: profile.replayRound)
                        Players(playerCount: profile.playerCount, playerNames: profile.playerNames)
                    }
                    Spacer()
                }
            }

        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
