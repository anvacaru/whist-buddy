//
//  AboutButton.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 16.04.2022.
//

import SwiftUI

struct AboutButton: View {
    @Binding var activeSheet: ActiveSheet?
    var body: some View {
        Button {
            activeSheet = ActiveSheet.about
        } label: {
            Label("How to play", systemImage: "questionmark")
        }
        .padding()
    }

}

struct AboutButton_Previews: PreviewProvider {
    static var previews: some View {
        AboutButton(activeSheet: .constant(ActiveSheet.about))
    }
}
