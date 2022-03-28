//
//  GameHost.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.03.2022.
//

import SwiftUI

struct GameHost: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    @State private var showingInput = false
    @State private var editMode:EditMode = .active
    @State private var info: AlertInfo? = nil
    @State private var alertType: AlertInfo.AlertType = AlertInfo.AlertType.noAlert

    var body: some View {
        VStack {
            HStack {
                Button {
                    showingProfile.toggle()
                    editMode = .active
                } label: {
                    Label("New Game", systemImage: "person.3.fill")
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost(showingProfile: $showingProfile)
                        .environmentObject(modelData)
                        .environment(\.editMode, $editMode)
                }
                .padding()
                
                if modelData.gameState == ModelData.GameState.inProgress && modelData.profile.currentRound < modelData.profile.gameHands.count {
                    Spacer()
                    
                    Button {
                        showingInput.toggle()
                        editMode = .active
                    } label: {
                        Label("Input \(modelData.hasBids ? "results" : "bids")", systemImage: "square.and.pencil")
                    }
                    .sheet(isPresented: $showingInput,
                           onDismiss: {
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

                    }) {
                        InputHost(showingInput: $showingInput, alertType: $alertType)
                            .environmentObject(modelData)
                            .environment(\.editMode, $editMode)
                    }
                    .alert(item: $info, content: { info in
                        Alert(title: Text(info.title),
                              message: Text(info.message))
                    })
                    .padding()
                }
                
                if modelData.gameState == ModelData.GameState.finished {
                    Spacer()
                    Button {
                        modelData.gameState = ModelData.GameState.inProgress
                    } label: {
                        Label("Scoreboard", systemImage: "tablecells.fill")
                    }
                    .padding()
                }
            }
            
            if modelData.gameState == ModelData.GameState.inProgress {
                ScrollView{
                    GameSummary()
                        .environmentObject(modelData)
                }
            }
            
            if modelData.gameState == ModelData.GameState.finished {
                GameStandings(players: Player.sortPlayers(players: modelData.players), playerCount: modelData.profile.playerCount)
            }

        }
    }
}

struct GameHost_Previews: PreviewProvider {
    static var previews: some View {
        GameHost()
            .environmentObject(ModelData())
    }
}
