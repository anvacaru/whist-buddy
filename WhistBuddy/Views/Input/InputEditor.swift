//
//  InputEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 19.03.2022.
//

import SwiftUI

struct InputEditor: View {
    var playerName:String
    @Binding var inputBid: Round.Bid
    var hand: Hand
    var isConstrained: Bool = false
    var sum: Int = 0
    var body: some View {
        VStack{
             Text(playerName)
            Picker("Players", selection: $inputBid) {
                ForEach(Round.Bid.allCases.filter{ $0.rawValue <= hand.rawValue}) { count in
                    if (!isConstrained || hand.rawValue != sum + count.rawValue - inputBid.rawValue) {
                        Text(String(count.rawValue)).tag(count)
                    }
                }
            }
            .pickerStyle(.segmented)
            Spacer()
        }
    }
}

struct InputEditor_Previews: PreviewProvider {
    static var previews: some View {
        InputEditor(playerName: "Andrei", inputBid: .constant(Round.Bid.zero), hand: Hand.one, isConstrained: true, sum: 0)
    }
}
