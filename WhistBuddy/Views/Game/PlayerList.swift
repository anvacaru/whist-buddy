//
//  PlayerList.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct PlayerList: View {
    var players:[Player]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hand")
                .frame(height: 58)
            Divider()
            ForEach(players) { player in
                Text(player.name)
                    .frame(height: 58)
                Divider()
            }
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(players: Player.initPlayers(playerNames: Profile.defaultNames, playerCount: Profile.PlayerCount.six))
    }
}
