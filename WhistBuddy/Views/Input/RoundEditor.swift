//
//  RoundEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 21.03.2022.
//

import SwiftUI

struct RoundEditor: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var round: Round
    @State private var input: [Round.Bid] = Round.default.bids
    
    var body: some View {
        VStack {
            Text("Input \(!modelData.hasBids ? "Bids" : "Results")")
                .font(.title)
                .bold()
            
            InputListEditor(input: $input, playerNames: modelData.profile.playerNames, round: $round, playerCount: modelData.profile.playerCount, hasBids: modelData.hasBids, hasResults: modelData.hasResults)
        }
    }
}

struct RoundEditor_Previews: PreviewProvider {
    static var previews: some View {
        RoundEditor(round: .constant(Round.default))
            .environmentObject(ModelData())
    }
}
