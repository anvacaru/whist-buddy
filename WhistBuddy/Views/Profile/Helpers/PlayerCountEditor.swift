//
//  PlayerCountEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct PlayerCountEditor: View {
    @Binding var playerCount: Profile.PlayerCount
    var body: some View {

        VStack(alignment: .leading, spacing: 20) {
            Text("Number of Players")
                .font(.title3)
                .bold()
            
            Picker("Players", selection: $playerCount) {
                ForEach(Profile.PlayerCount.allCases) { count in
                    Text(String(count.rawValue)).tag(count)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct PlayerCountEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCountEditor(playerCount:.constant(Profile.PlayerCount.four))
    }
}
