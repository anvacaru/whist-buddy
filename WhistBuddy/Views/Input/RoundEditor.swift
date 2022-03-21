//
//  RoundEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 21.03.2022.
//

import SwiftUI

struct RoundEditor: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var inputRound: Round
    @State private var input: [Round.Bid] = Round.default.bids
    
    var body: some View {
        List {
            ForEach(0..<modelData.profile.playerCount.rawValue) { idx in
                InputEditor(playerName: modelData.profile.playerNames[idx], inputBid: $input[idx], hand: inputRound.hand)
                    .onAppear() {
                        input = inputRound.bids
                    }
                    .onDisappear() {
                        if (!modelData.hasBids && !modelData.hasResults) {
                            inputRound.bids = input
                        } else {
                            inputRound.results = input
                        }
                    }
            }
        }
    }
}

struct RoundEditor_Previews: PreviewProvider {
    static var previews: some View {
        RoundEditor(inputRound: .constant(Round.default))
            .environmentObject(ModelData())
    }
}
