//
//  InputList.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct InputListEditor: View {
    var players: [Player]
    @Binding var round: Round
    var hasBids: Bool
    var currentRound: Int
    @State private var input: [Round.Bid] = Round.default.bids
    @State private var sum : Int = 0
    @State private var auxInput: Round.Bid = Round.Bid.zero

    var body: some View {
        List {
            ForEach(0..<players.count - 1, id: \.self) { id in
                let index = (id + currentRound) % players.count
                InputEditor(playerName: players[index].name, inputBid: $input[index], hand: round.hand)
                    .onAppear() {
                        input[index] = round.bids[index]
                    }
                    .onDisappear() {
                        if (!hasBids) {
                            round.bids[index] = input[index]
                        } else {
                            round.results[index] = input[index]
                        }
                    }
            }
            .onChange(of: input) { newInput in
                sum = newInput.reduce(0) {$0 + $1.rawValue}
            }

            let index = (players.count - 1 + currentRound) % players.count
            ConstrainedInputEditor(playerName: players[index].name, inputBid: $auxInput, hand: round.hand, isConstrained: !hasBids, sum: sum)
                .onAppear() {
                    auxInput = round.bids[index]
                }
                .onDisappear() {
                    if !hasBids {
                        round.bids[index] = auxInput
                    } else {
                        round.results[index] = auxInput
                    }
                }
        }
    }
}

struct InputListEditor_Previews: PreviewProvider {
    static var previews: some View {
        InputListEditor(players: Player.initPlayers(playerNames: Profile.defaultNames, playerCount: Profile.PlayerCount.six), round: .constant(Round.default), hasBids: false, currentRound: 1)
    }
}
