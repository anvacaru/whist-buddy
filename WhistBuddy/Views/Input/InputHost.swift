//
//  InputHost.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 19.03.2022.
//

import SwiftUI

struct InputHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @Binding var showingInput: Bool
    @State private var draftRound: Round = Round.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftRound = modelData.rounds[modelData.profile.currentRound]
                        editMode?.animation().wrappedValue = .inactive
                        showingInput = false
                    }
                }
                Spacer()
                EditButton()
            }
            .padding()
            
            if editMode?.wrappedValue == .active {
                RoundEditor(inputRound: $draftRound)
                    .onAppear() {
                        draftRound = modelData.rounds[modelData.profile.currentRound]
                    }
                    .onDisappear() {
                        if !modelData.hasBids {
                            if draftRound.validateBids() {
                                modelData.hasBids = true
                                modelData.rounds[modelData.profile.currentRound] = draftRound
                            }
                        } else {
                            if !modelData.hasResults {
                                if draftRound.validateResults() {
                                    modelData.hasResults = true
                                    modelData.scores = draftRound.computeScore(previousScores: modelData.scores)
                                    modelData.rounds[modelData.profile.currentRound] = draftRound
                                    modelData.profile.currentRound += 1;
                                    modelData.hasBids = false
                                    modelData.hasResults = false
                                }
                            }
                        }
                        showingInput = false
                    }
            }
        }
    }
}

struct InputHost_Previews: PreviewProvider {
    static var previews: some View {
        InputHost(showingInput: .constant(true))
            .environmentObject(ModelData())
    }
}
