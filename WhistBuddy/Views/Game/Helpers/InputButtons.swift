//
//  InputButton.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 04.04.2022.
//

import SwiftUI

struct InputButtons: View {
    @EnvironmentObject var modelData: ModelData
    @State private var editMode:EditMode = .active
    @State private var info: AlertInfo? = nil
    @State private var alertType: AlertInfo.AlertType = AlertInfo.AlertType.noAlert
    @State private var showingInput = false

    var body: some View {
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
        
        if modelData.hasBids {
            Spacer()
            Button {
                modelData.hasBids = false
                showingInput.toggle()
                editMode = .active
            } label: {
                Label("Bid replace", systemImage: "square.and.pencil")
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
            })
            .padding()
        }
    }
}

struct InputButtons_Previews: PreviewProvider {
    static var previews: some View {
        InputButtons()
    }
}
