//
//  NewGameButton.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 11.04.2022.
//

import SwiftUI

struct NewGameButton: View {
    @Binding var activeSheet: ActiveSheet?
    @Binding var editMode:EditMode

    var body: some View {
        Button {
            activeSheet = ActiveSheet.profile
            editMode = .active
        } label: {
            Label("New Game", systemImage: "person.3.fill")
        }
        .padding()
    }
}

struct NewGameButton_Previews: PreviewProvider {
    static var previews: some View {
        NewGameButton(activeSheet: .constant(nil), editMode: .constant(.active))
    }
}
