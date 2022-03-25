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
        VStack {
            Text("Standings")
                .font(.title)
                .bold()
    
            List {
                ForEach(0..<playerCount.rawValue, id:\.self) { index in
                    HStack{
                        Text(players[index].name)
                        Spacer()
                        Text(String(players[index].score))
                    }
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
