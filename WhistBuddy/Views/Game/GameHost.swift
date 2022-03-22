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
    var body: some View {
        VStack{
            if modelData.gameState == ModelData.GameState.inProgress {
                GameSummary()
                    .environmentObject(modelData)
            }
            
            if modelData.gameState == ModelData.GameState.finished {
                GameStandings(players: Player.sortPlayers(players: modelData.players), playerCount: modelData.profile.playerCount)
            }

            HStack{
                if modelData.gameState == ModelData.GameState.inProgress {
                    Button {
                        showingInput.toggle()
                        editMode = .active
                    } label: {
                        Label("Input", systemImage: "person.crop.circle")
                    }
                    .sheet(isPresented: $showingInput) {
                        InputHost(showingInput: $showingInput)
                            .environmentObject(modelData)
                            .environment(\.editMode, $editMode)
                    }
                    .padding()
                    Spacer()
                }
                                
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("Game Settings", systemImage: "person.crop.circle")
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
                .padding()
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
