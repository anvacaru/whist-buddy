//
//  InputButton.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 04.04.2022.
//

import SwiftUI

struct InputButton: View {
    @Binding var editMode:EditMode
    @Binding var alertType: AlertInfo.AlertType
    @Binding var activeSheet: ActiveSheet?
    var hasBids: Bool

    var body: some View {
        Button {
            activeSheet = ActiveSheet.input
            editMode = .active
        } label: {
            Label("Input \(hasBids ? "Results" : "Bids")", systemImage: "square.and.pencil")
        }
        .padding()
    }
}

struct InputButton_Previews: PreviewProvider {
    static var previews: some View {
        InputButton(editMode: .constant(.active), alertType: .constant(AlertInfo.AlertType.noAlert), activeSheet: .constant(nil), hasBids: false)
    }
}
