//
//  RoundText.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 25.03.2022.
//

import SwiftUI

struct RoundText: View {
    var value: Int
    var display: Bool
    var awarded: Bool = false
    var deprived: Bool = false
    var strikethrough: Bool = false
    
    var body: some View {

        if strikethrough {
            Text(display ? String(value) : "")
                .strikethrough()
                .frame(width: 28, height: 25)
                .border(awarded ? .green : deprived ? .red : .clear)
        } else {
            Text(display ? String(value) : "")
                .frame(width: 28, height: 25)
                .border(awarded ? .green : deprived ? .red : .clear)
        }
        
    }
}

struct RoundText_Previews: PreviewProvider {
    static var previews: some View {
        RoundText(value: 1, display: true)
    }
}
