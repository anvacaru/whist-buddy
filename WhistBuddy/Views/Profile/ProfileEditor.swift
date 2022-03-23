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
        List {
            VStack(alignment: .leading, spacing: 20) {
                Text("Number of Players")
                    .bold()
                
                Picker("Players", selection: $profile.playerCount) {
                    ForEach(Profile.PlayerCount.allCases) { count in
                        Text(String(count.rawValue)).tag(count)
                    }
                }
                .pickerStyle(.segmented)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Game Mode").bold()
                
                Picker("Game Mode", selection: $profile.gameMode) {
                    ForEach(Profile.GameMode.allCases) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Toggle(isOn: $profile.prefersBonus) {
                Text("Enable Streak Bonus")
                    .bold()
            }
            if profile.prefersBonus {
                Text("Bonus Value")
                    .bold()
                Picker("Bonus value", selection: $profile.bonusValue) {
                    ForEach(1..<11, id: \.self) { value in
                        Text(String(value))
                            .tag(String(value))
                    }
                }
                .pickerStyle(.wheel)
            }
            Toggle(isOn: $profile.replayRound) {
                Text("Replay round if everyone loses")
                    .bold()
            }
            ForEach(0..<profile.playerCount.rawValue, id:\.self) { index in
                TextField("Player Name", text: $profile.playerNames[index])
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
