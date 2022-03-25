//
//  ProfileHost.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @Binding var showingProfile: Bool
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                    Spacer()
                    EditButton()
                }

            }

            if editMode?.wrappedValue == .active {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                        modelData.profile.initGameHands()
                        modelData.rounds = Round.initGameRounds(playerCount: modelData.profile.playerCount, gameHands: modelData.profile.gameHands)
                        modelData.players = Player.initPlayers(playerNames: modelData.profile.playerNames, playerCount: modelData.profile.playerCount)
                        modelData.profile.currentRound = 0
                        modelData.gameState = ModelData.GameState.inProgress
                        showingProfile = false
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(showingProfile: .constant(true))
            .environmentObject(ModelData())
    }
}
