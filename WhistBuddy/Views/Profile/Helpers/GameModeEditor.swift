//
//  GameModeEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct GameModeEditor: View {
    @Binding var gameMode: Profile.GameMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Game Mode")
                    .font(.title3)
                    .bold()
                Text("Choose if the game would begin with 1 card hands or 8 card hands.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Picker("Game Mode", selection: $gameMode) {
                ForEach(Profile.GameMode.allCases) { mode in
                    Text(mode.rawValue).tag(mode)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct GameModeEditor_Previews: PreviewProvider {
    static var previews: some View {
        GameModeEditor(gameMode:.constant(Profile.GameMode.standard))
    }
}
