//
//  Menu.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 11.04.2022.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case profile, input, about
    
    var id: Int { hashValue }
}

struct MenuList: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var editMode:EditMode
    @Binding var alertType: AlertInfo.AlertType
    @Binding var activeSheet: ActiveSheet?

    var body: some View {
        Menu {
            if modelData.hasBids {
                Button(action: displayChangeBidButton) {
                    Label("Change Bid", systemImage: "doc")
                }
            }
            
            NewGameButton(activeSheet: $activeSheet, editMode: $editMode)
            
            AboutButton(activeSheet: $activeSheet)

        }
        label: {
            Label("More", systemImage: "ellipsis")
        }
    }
    
    func displayChangeBidButton() {
        modelData.hasBids = false
        activeSheet = ActiveSheet.input
        editMode = .active
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(editMode: .constant(.active), alertType: .constant(AlertInfo.AlertType.noAlert), activeSheet: .constant(nil))
            .environmentObject(ModelData())
    }
}
