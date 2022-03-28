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
    @Binding var alertType: AlertInfo.AlertType


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftRound = modelData.rounds[modelData.profile.currentRound]
                        editMode?.animation().wrappedValue = .inactive
                        showingInput = false
                    }
                    .tag("Cancel")
                    Spacer()
                    EditButton()
                }
            }
            .padding()
            
            if editMode?.wrappedValue == .active {
                RoundEditor(round: $draftRound)
                    .onAppear() {
                        draftRound = modelData.rounds[modelData.profile.currentRound]
                        alertType = AlertInfo.AlertType.noAlert
                    }
                    .onDisappear() {
                        if !modelData.hasBids {
                            if draftRound.validateBids() {
                                modelData.hasBids = true
                                modelData.rounds[modelData.profile.currentRound] = draftRound
                            } else {
                                alertType = AlertInfo.AlertType.invalidBids
                            }
                        } else {
                            if !modelData.hasResults {
                                if draftRound.validateResults() {
                                    if (modelData.profile.replayRound && draftRound.replayRound()) {
                                        alertType = AlertInfo.AlertType.roundRepeat
                                        modelData.hasBids = false
                                        modelData.hasResults = false
                                        modelData.rounds[modelData.profile.currentRound] = Round(id: draftRound.id, playerCount: modelData.profile.playerCount, hand: draftRound.hand)
                                    } else {
                                        modelData.hasResults = true
                                        modelData.updatePlayerScores(round: draftRound)
                                        draftRound.setScores(players: modelData.players)
                                        modelData.rounds[modelData.profile.currentRound] = draftRound
                                        modelData.profile.currentRound += 1;
                                        modelData.hasBids = false
                                        modelData.hasResults = false
                                        if modelData.profile.currentRound == modelData.profile.gameHands.count {
                                            modelData.gameState = ModelData.GameState.finished
                                        }
                                    }
                                } else {
                                    alertType = AlertInfo.AlertType.invalidResults
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
        InputHost(showingInput: .constant(true), alertType: .constant(AlertInfo.AlertType.roundRepeat))
            .environmentObject(ModelData())
    }
}
