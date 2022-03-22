//
//  GameStandings.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 22.03.2022.
//

import SwiftUI

struct GameStandings: View {
    var players: [Player]
    var playerCount: Profile.PlayerCount
    
    var body: some View {
        List {
            ForEach(0..<playerCount.rawValue) { idx in
                HStack{
                    Text(players[idx].name)
                    Spacer()
                    Text(String(players[idx].score))
                }
            }
        }
    }
}

struct GameStandings_Previews: PreviewProvider {
    static var previews: some View {
        GameStandings(players:Player.initPlayers(playerNames: Profile.defaultNames, playerCount: Profile.PlayerCount.six), playerCount: Profile.PlayerCount.six)
    }
}
