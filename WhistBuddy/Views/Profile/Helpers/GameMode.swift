//
//  GameMode.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct GameMode: View {
    var gameMode: Profile.GameMode

    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                Text("Game mode")
                    .font(.title3)
                    .bold()
                Text("Choose if the game would begin with 1 card hands or 8 card hands.")
                    .font(.caption)
            }
            Spacer()
            Text(gameMode.rawValue)
                .font(.title3)
                .bold()
            
        }
        .padding()
    }
}

struct GameMode_Previews: PreviewProvider {
    static var previews: some View {
        GameMode(gameMode: Profile.GameMode.standard)
    }
}
