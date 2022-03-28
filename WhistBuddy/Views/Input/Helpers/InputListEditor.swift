//
//  InputList.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct InputListEditor: View {
    var playerNames: [String]
    @Binding var round: Round
    var playerCount: Profile.PlayerCount
    var hasBids: Bool
    @State private var input: [Round.Bid] = Round.default.bids

    var body: some View {
        List {
            ForEach(0..<playerCount.rawValue, id: \.self) { idx in
                InputEditor(playerName: playerNames[idx], inputBid: $input[idx], hand: round.hand)
                    .onAppear() {
                        input = round.bids
                    }
                    .onDisappear() {
                        if (!hasBids) {
                            round.bids = input
                        } else {
                            round.results = input
                        }
                    }
            }
        }
    }
}

struct InputListEditor_Previews: PreviewProvider {
    static var previews: some View {
        InputListEditor(playerNames: Profile.defaultNames, round: .constant(Round.default), playerCount: Profile.default.playerCount, hasBids: false)
    }
}
