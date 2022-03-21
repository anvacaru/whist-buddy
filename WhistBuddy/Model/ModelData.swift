//
//  ModelData.swift
//  WhistBuddy
//
//  Created by Andrei Vacaru on 15.03.2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var profile = Profile.default
    @Published var rounds = [Round.default]
    @Published var isIntialized:Bool = false
    @Published var scores: [Int] = Array(repeating: 0, count: 6)
    @Published var hasBids: Bool = false
    @Published var hasResults: Bool = false
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
