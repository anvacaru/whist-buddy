//
//  PlayerNamesEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct PlayerNamesEditor: View {
    var playerCount: Profile.PlayerCount
    @Binding var playerNames: [String]
    var body: some View {
            ForEach(0..<playerCount.rawValue, id:\.self) { index in
                TextField("Player Name", text: $playerNames[index])
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .border(playerNames[index].isEmpty ? Color.red : Color.clear)
                    .onDisappear {
                        playerNames[index] = playerNames[index].isEmpty ? Profile.defaultNames[index] : playerNames[index]
                    }
                    .onSubmit {
                        playerNames[index] = playerNames[index].isEmpty ? Profile.defaultNames[index] : playerNames[index]
                    }
                    .onTapGesture {
                        playerNames[index] = ""
                    }
            }
    }
}

struct PlayerNamesEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNamesEditor(playerCount:Profile.PlayerCount.six, playerNames: .constant(Profile.defaultNames))
    }
}
