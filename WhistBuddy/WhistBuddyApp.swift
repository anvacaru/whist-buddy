//
//  WhistBuddyApp.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import SwiftUI

@main
struct WhistBuddyApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            GameHost()
                .environmentObject(modelData)
        }
    }
}
