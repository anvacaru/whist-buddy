//
//  ReplayRound.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct ReplayRound: View {
    var replayRound: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Replay round")
                    .font(.title3)
                    .bold()
                Text("Choose if a round is replayed when all players fail to win their hand.")
                    .font(.caption)
            }
            Spacer()
            Text(replayRound ? "Yes" : "No")
                .font(.title3)
                .bold()
            
        }
        .padding()
    }
}

struct ReplayRound_Previews: PreviewProvider {
    static var previews: some View {
        ReplayRound(replayRound: true)
    }
}
