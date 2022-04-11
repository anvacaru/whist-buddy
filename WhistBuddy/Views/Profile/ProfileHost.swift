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
    @Binding var activeSheet: ActiveSheet?
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                        activeSheet = nil
                    }
                    Spacer()
                    Button("Done") {
                        initGame()
                    }
                }
            }

            if editMode?.wrappedValue == .active {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
            }
        }
        .padding()
    }
    
    func initGame() {
        modelData.profile = draftProfile
        modelData.profile.initGameHands()
        modelData.rounds = Round.initGameRounds(playerCount: modelData.profile.playerCount, gameHands: modelData.profile.gameHands)
        for index in 0 ..< modelData.profile.playerCount.rawValue {
            modelData.profile.playerNames[index] = modelData.profile.playerNames[index].isEmpty ? Profile.defaultNames[index] : modelData.profile.playerNames[index]
        }
        modelData.players = Player.initPlayers(playerNames: modelData.profile.playerNames, playerCount: modelData.profile.playerCount)
        modelData.hasBids = false
        modelData.profile.currentRound = 0
        modelData.gameState = ModelData.GameState.inProgress
        editMode?.animation().wrappedValue = .inactive
        activeSheet = nil
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(activeSheet: .constant(ActiveSheet.first))
            .environmentObject(ModelData())
    }
}
