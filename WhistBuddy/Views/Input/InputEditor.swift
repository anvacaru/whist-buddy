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
    var body: some View {
        VStack{
 
            Text(playerName)
            Picker("Players", selection: $inputBid) {
                ForEach(Round.Bid.allCases.filter{ $0.rawValue <= hand.rawValue }) { count in
                    Text(String(count.rawValue)).tag(count)
                }
            }
            .pickerStyle(.segmented)
            Spacer()
        }
    }
}

struct InputEditor_Previews: PreviewProvider {
    static var previews: some View {
        InputEditor(playerName: "Andrei", inputBid: .constant(Round.Bid.zero), hand: Hand.eight)
    }
}
