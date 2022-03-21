//
//  GameHead.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct GameHead: View {
    var profile: Profile
    var playerIndex:Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:.center, spacing: 0) {
                Text(profile.playerNames[playerIndex])
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).hidden()
                    
                Divider()
                ForEach(1...profile.currentRound + 1, id:\.self) { idx in
                    Text(String(profile.gameHands[idx-1].rawValue))
                        .padding()
                }
            }
        }
    }
}

struct GameHead_Previews: PreviewProvider {
    static var previews: some View {
        GameHead(profile: Profile.default, playerIndex: 0)
    }
}
