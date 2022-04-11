//
//  GameHeader.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 11.04.2022.
//

import SwiftUI

struct GameHeader: View {
    @EnvironmentObject var modelData: ModelData
    @State private var editMode:EditMode = .active
    @State private var info: AlertInfo? = nil
    @State private var alertType: AlertInfo.AlertType = AlertInfo.AlertType.noAlert
    @State private var activeSheet: ActiveSheet? = nil

    var body: some View {
        HStack {
            switch modelData.gameState {
            case ModelData.GameState.notInitialized:
                NewGameButton(activeSheet: $activeSheet, editMode: $editMode)
            case ModelData.GameState.inProgress:
                if modelData.profile.currentRound < modelData.profile.gameHands.count {
                    InputButton(editMode: $editMode, alertType: $alertType, activeSheet: $activeSheet, hasBids: modelData.hasBids)
                    
                    Spacer()
                    
                    MenuList(editMode: $editMode, alertType: $alertType, activeSheet: $activeSheet)
                }
            case ModelData.GameState.finished: do {
                NewGameButton(activeSheet: $activeSheet, editMode: $editMode)
                Spacer()
                Button {
                    modelData.gameState = ModelData.GameState.inProgress
                } label: {
                    Label("Scoreboard", systemImage: "tablecells.fill")
                }
                .padding()
            }
            }
        }
        .fullScreenCover(item: $activeSheet, onDismiss: {
            switch alertType {
            case AlertInfo.AlertType.roundRepeat: do {
                info = AlertInfo.roundRepeat
            }
            case AlertInfo.AlertType.invalidBids: do {
                info = AlertInfo.invalidBids
            }
            case AlertInfo.AlertType.invalidResults: do {
                info = AlertInfo.invalidResults
            }
            case AlertInfo.AlertType.noAlert: do {
                info = nil
            }
            }
        }) { item in
            switch item {
            case .first:
                ProfileHost(activeSheet: $activeSheet)
                    .environmentObject(modelData)
                    .environment(\.editMode, $editMode)
            case .second:
                InputHost(activeSheet: $activeSheet, alertType: $alertType)
                    .environmentObject(modelData)
                    .environment(\.editMode, $editMode)
            }
        }

        .alert(item: $info, content: { info in
            Alert(title: Text(info.title),
                  message: Text(info.message))
        })

    }
}

struct GameHeader_Previews: PreviewProvider {
    static var previews: some View {
        GameHeader()
            .environmentObject(ModelData())
    }
}
