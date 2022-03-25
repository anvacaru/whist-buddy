//
//  StreakBonusEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct StreakBonusEditor: View {
    @Binding var prefersBonus: Bool
    var body: some View {
        Toggle(isOn: $prefersBonus) {
            VStack(alignment: .leading) {
                Text("Enable Streak Bonus")
                    .font(.title3)
                    .bold()
                Text("When a player gets a 5 streak win, he will get awarded. Same goes for losing.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct StreakBonusEditor_Previews: PreviewProvider {
    static var previews: some View {
        StreakBonusEditor(prefersBonus:.constant(true))
    }
}
