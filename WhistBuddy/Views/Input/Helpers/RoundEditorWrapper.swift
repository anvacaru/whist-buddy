//
//  RoundEditorWrapper.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 29.03.2022.
//

import SwiftUI

struct RoundEditorWrapper: View {
    @EnvironmentObject var modelData: ModelData

    @Binding var draftRound: Round
    @Binding var applyChanges: Bool
    @Binding var alertType: AlertInfo.AlertType
    @Binding var activeSheet: ActiveSheet?
    
    var body: some View {
        
        RoundEditor(round: $draftRound)
            .onAppear() {
                initInputHost()
            }
            .onDisappear() {
                if applyChanges {
                    if !modelData.hasBids {
                        assignBids()
                    } else {
                        assignResults()
                    }
                }
                activeSheet = nil
            }
    }
    
    func initInputHost() {
        draftRound = modelData.rounds[modelData.profile.currentRound]
        alertType = AlertInfo.AlertType.noAlert
        applyChanges = false
    }
    
    func assignBids() {
        if draftRound.validateBids() {
            modelData.hasBids = true
            modelData.rounds[modelData.profile.currentRound] = draftRound
        } else {
            alertType = AlertInfo.AlertType.invalidBids
        }
    }
    
    func assignResults() {
        if draftRound.validateResults() {
            if (modelData.profile.replayRound && draftRound.replayRound()) {
                alertType = AlertInfo.AlertType.roundRepeat
                modelData.hasBids = false
                modelData.rounds[modelData.profile.currentRound] = Round(id: draftRound.id, playerCount: modelData.profile.playerCount, hand: draftRound.hand)
            } else {
                modelData.updatePlayerScores(round: draftRound)
                draftRound.setScores(players: modelData.players)
                modelData.rounds[modelData.profile.currentRound] = draftRound
                modelData.profile.currentRound += 1;
                modelData.hasBids = false
                modelData.checkForGameEnd()
            }
        } else {
            alertType = AlertInfo.AlertType.invalidResults
        }
    }
}

struct RoundEditorWrapper_Previews: PreviewProvider {
    static var previews: some View {
        RoundEditorWrapper(draftRound: .constant(Round.default), applyChanges: .constant(true), alertType: .constant(AlertInfo.AlertType.noAlert), activeSheet: .constant(nil))
    }
}
