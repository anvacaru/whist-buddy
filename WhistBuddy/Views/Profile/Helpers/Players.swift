//
//  Players.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct Players: View {
    var playerCount: Profile.PlayerCount
    var playerNames: [String]

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Player Names")
                    .bold()
                    .font(.title3)
                Divider()
                ForEach(0..<playerCount.rawValue, id:\.self) { index in
                    Text(playerNames[index])
                        .tag(playerNames[index])
                    Divider()
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct Players_Previews: PreviewProvider {
    static var previews: some View {
        Players(playerCount: Profile.PlayerCount.six, playerNames: Profile.defaultNames)
    }
}
