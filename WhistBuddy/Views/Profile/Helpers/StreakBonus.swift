//
//  StreakBonus.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct StreakBonus: View {
    var prefersBonus: Bool
    var bonusValue: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment:.leading) {
                    Text("Streak bonus")
                        .font(.title3)
                        .bold()
                    Text("When a player gets a 5 streak win, he will get awarded. Same goes for losing.")
                        .font(.caption)
                }
                Spacer()
                Text(prefersBonus ? "Yes" : "No")
                    .font(.title3)
                    .bold()
                
            }
            if prefersBonus {
                HStack {
                    Text("Streak Bonus Points")
                        .font(.subheadline)
                        .bold()
                        .padding(.leading)
                    Spacer()
                    Text(String(bonusValue))
                        .font(.subheadline)
                        .bold()

                }
            }
                
        }
        .padding()
    }
}

struct StreakBonus_Previews: PreviewProvider {
    static var previews: some View {
        StreakBonus(prefersBonus: true, bonusValue: 5)
    }
}
