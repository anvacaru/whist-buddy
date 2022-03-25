//
//  ReplayRoundEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct ReplayRoundEditor: View {
    @Binding var replayRound: Bool
    var body: some View {
        Toggle(isOn: $replayRound) {
            VStack(alignment: .leading) {
                Text("Replay round")
                    .font(.title3)
                    .bold()
                Text("Choose if a round is replayed when all players fail to win their hand.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ReplayRoundEditor_Previews: PreviewProvider {
    static var previews: some View {
        ReplayRoundEditor(replayRound: .constant(true))
    }
}
