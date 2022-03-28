//
//  Alert.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 28.03.2022.
//

import Foundation

struct AlertInfo: Identifiable {

    enum AlertType {
        case noAlert
        case roundRepeat
        case invalidBids
        case invalidResults
    }
    
    let id: AlertType
    let title: String
    let message: String
    
    
    static var roundRepeat = AlertInfo(id: AlertInfo.AlertType.invalidResults, title: "Round Replay", message: "All players have failed their hand. The round will restart.")
    
    static var invalidBids = AlertInfo(id: AlertInfo.AlertType.invalidBids, title: "Invalid Bidding", message: "The sum of all bids has to be different than the round hand.")
    
    static var invalidResults = AlertInfo(id: AlertInfo.AlertType.invalidResults, title: "Invalid Results", message: "The sum of all results has to be equal to the round hand.")
    
    static var noAlert = AlertInfo(id: AlertInfo.AlertType.noAlert, title: "", message: "")
}

