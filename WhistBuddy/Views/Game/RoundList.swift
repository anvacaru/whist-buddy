//
//  RoundList.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct RoundList: View {
    var round: Round
    var playerCount: Profile.PlayerCount
    var currentRound: Int
    var body: some View {
        VStack {
            Text(String(round.hand.rawValue))
                .frame(width:58, height: 58)
            Divider()
            ForEach(0..<playerCount.rawValue, id:\.self) { index in
                RoundEntry(round: round, playerIndex: index, currentRound: currentRound)
                Divider()
            }
        }
    }
}

struct RoundList_Previews: PreviewProvider {
    static var previews: some View {
        RoundList(round: Round.default, playerCount: Profile.PlayerCount.six, currentRound: 1)
    }
}
