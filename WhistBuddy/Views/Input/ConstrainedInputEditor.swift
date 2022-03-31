//
//  ConstrainedInputEditor.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 31.03.2022.
//

import SwiftUI

struct ConstrainedInputEditor: View {
    var playerName:String
    @Binding var inputBid: Round.Bid
    var hand: Hand
    var isConstrained: Bool = false
    var sum: Int = 0
    @State private var justChanged = false

    var body: some View {
        VStack{
            Text(playerName)
            Picker("Players", selection: $inputBid) {
                ForEach(Round.Bid.allCases.filter{ $0.rawValue <= hand.rawValue}) { count in
                    if (!isConstrained || hand.rawValue != sum + count.rawValue) {
                        Text(String(count.rawValue)).tag(count)
                    } else {
                        Text("").foregroundColor(.secondary)
                    }
                }
            }
            .onChange(of: sum) { newSum in
                if isConstrained {
                    inputBid = Round.Bid.allCases.first(where: {$0.rawValue + newSum != hand.rawValue}) ?? Round.Bid.one
                }
            }

            .pickerStyle(.segmented)
            Spacer()
        }
    }
}

struct ConstrainedInputEditor_Previews: PreviewProvider {
    static var previews: some View {
        ConstrainedInputEditor(playerName: "Andrei", inputBid: .constant(Round.Bid.zero), hand: Hand.one, isConstrained: true, sum: 0)
    }
}
