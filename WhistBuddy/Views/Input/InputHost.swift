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
    @Binding var activeSheet: ActiveSheet?
    @Binding var alertType: AlertInfo.AlertType
    @State private var applyChanges: Bool = false
    @State private var draftRound: Round = Round.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftRound = modelData.rounds[modelData.profile.currentRound]
                        editMode?.animation().wrappedValue = .inactive
                        activeSheet = nil
                        applyChanges = false
                    }
                    .tag("Cancel")
                    
                    Spacer()
                    
                    Button(action: {
                        editMode?.animation().wrappedValue = .inactive
                        applyChanges = true
                    }) {
                        Text("Done")
                    }
                    .tag("Done")
                }
            }
            .padding()
            
            if editMode?.wrappedValue == .active {
                RoundEditorWrapper(draftRound: $draftRound, applyChanges: $applyChanges, alertType: $alertType, activeSheet: $activeSheet)
                    .environmentObject(modelData)
            }
        }
    }
}

struct InputHost_Previews: PreviewProvider {
    static var previews: some View {
        InputHost(activeSheet: .constant(ActiveSheet.input), alertType: .constant(AlertInfo.AlertType.roundRepeat))
            .environmentObject(ModelData())
    }
}
