//
//  StreakBonusValueEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct StreakBonusValueEditor: View {
    @Binding var bonusValue: Int

    var body: some View {
        VStack {
            Text("Bonus Value")
                .bold()
            Picker("Bonus value", selection: $bonusValue) {
                ForEach(1..<11, id: \.self) { value in
                    Text(String(value))
                        .tag(String(value))
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct StreakBonusValueEditor_Previews: PreviewProvider {
    static var previews: some View {
        StreakBonusValueEditor(bonusValue: .constant(10))
    }
}
