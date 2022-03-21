//
//  Hand.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 19.03.2022.
//

import Foundation

enum Hand: Int, CaseIterable, Identifiable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    
    var id: Int { rawValue }
}
