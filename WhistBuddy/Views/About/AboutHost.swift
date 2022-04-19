//
//  AboutHost.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.04.2022.
//

import SwiftUI

struct AboutHost: View {
    @Binding var activeSheet: ActiveSheet?
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Spacer()
                Button("Done") {
                    activeSheet = nil
                }
            }
            HStack {
                Spacer()
                Text("Whist Buddy")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            HStack {
                Spacer()
                Text("How to play")
                    .font(.callout)
                    .padding(.bottom)
            
                Spacer()
            }

            VStack(alignment: .leading) {
                Text("The scoreboard is made out of rows and columns.")
                Text("Each column represents a round and each row represents a player score.")
                Text("Each column will have an entry for each player, like the one below.")
            }
            .font(.body)
            
            HStack {
                Spacer()
                RoundEntry(round: Round.default, playerIndex: 1, currentRound: 1, displayBid: true, displayScore: true)
                Spacer()
            }

            VStack(alignment:.leading) {
                Text("An entry is made out of three numbers:")
                VStack(alignment:.leading) {
                    Text(" - On top left, how many cards a player said it will win.")
                    Text(" - On bottom left, how many cards the player actually won.")
                    Text(" - On right, the points earned in the current round.")
                }
                .padding(.leading)
                .padding(.bottom)
                Text("For each round, you have to input all the player bets and results. using the `Input` Buttons.")
            }
            .font(.body)
            Spacer()
        }
        .padding()
    }
}

struct AboutHost_Previews: PreviewProvider {
    static var previews: some View {
        AboutHost(activeSheet: .constant(ActiveSheet.about))
    }
}
