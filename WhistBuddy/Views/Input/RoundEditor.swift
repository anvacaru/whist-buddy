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
    
    var body: some View {
        VStack {
            Text("Input \(!modelData.hasBids ? "Bids" : "Results")")
                .font(.title)
                .bold()
            Text(String(round.hand.rawValue))
                .hidden()
            Text("First player is: \(modelData.profile.playerNames[modelData.profile.currentRound % modelData.profile.playerCount.rawValue])")
            
            InputListEditor(playerNames: modelData.profile.playerNames, round: $round, playerCount: modelData.profile.playerCount, hasBids: modelData.hasBids)
        }
    }
    

}

struct RoundEditor_Previews: PreviewProvider {
    static var previews: some View {
        RoundEditor(round: .constant(Round.default))
            .environmentObject(ModelData())
    }
}
