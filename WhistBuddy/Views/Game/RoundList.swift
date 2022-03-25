//
//  RoundList.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct RoundList: View {
    var round: Round
    var players: [Player]
    var currentRound: Int
    var displayBid: Bool
    var displayScore: Bool
    
    var body: some View {
        VStack {
            Text(String(round.hand.rawValue))
                .frame(width:58, height: 58)
            Divider()
            ForEach(players) { player in
                RoundEntry(round: round, playerIndex: player.id, currentRound: currentRound, displayBid: displayBid, displayScore: displayScore, awarded: player.awardedIn.contains(round.id), deprived: player.deprivedIn.contains(round.id))
                Divider()
            }
        }
    }
}

struct RoundList_Previews: PreviewProvider {
    static var previews: some View {
        RoundList(round: Round.default, players:Player.initPlayers(playerNames: Profile.defaultNames, playerCount: Profile.PlayerCount.six), currentRound: 1, displayBid: true, displayScore: true)
    }
}
