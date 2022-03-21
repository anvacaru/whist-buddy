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
            VStack(alignment: .leading, spacing: 10) {
                Text("Game Settings")
                    .bold()
                    .font(.title)
                Text("Game mode: \(profile.gameMode.rawValue)")
                Text("Players: \(profile.playerCount.rawValue)")
                Text("Streak bonus: \(profile.prefersBonus ? "Yes" :"No" ) ")
                if profile.prefersBonus{
                    Text("Streak Bonus Value: \(profile.bonusValue) points")
                }
                Text("Player Names")
                    .bold()
                    .font(.title3)
                VStack(alignment: .leading){
                    ForEach(0..<profile.playerCount.rawValue, id:\.self) {index in
                        Text(profile.playerNames[index]).tag(profile.playerNames[index])
                    }
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
