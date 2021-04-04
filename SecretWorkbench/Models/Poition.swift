//
//  Poition.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 30/03/2021.
//

import Foundation
// MARK: - MainResponse
struct MainResponse: Codable {
    let potion: [Potion]
}

// MARK: - Potion
struct Potion: Identifiable, Codable {
    var id = UUID()
    let name, potionDescription, image, elexirType: String
    let battleType: BattleType
    let mainEffect: Effects
    let potionType: [PotionType]
    let twoReagents: [TwoReagent]
    let threeReagents: [ThreeReagent]

    enum CodingKeys: String, CodingKey {
        case name
        case potionDescription = "description"
        case image, elexirType, battleType, potionType, twoReagents, threeReagents, mainEffect
    }
}

// MARK: - PotionType
struct PotionType: Codable, Identifiable {
    let id = UUID()
    let name, solvent: String
    let level: Int
    let isChampion: Bool
    let duration, tripleDuration, amount: Double
}

// MARK: - TwoReagent
struct TwoReagent: Codable, Identifiable {
    let id = UUID()
    let firstMainIngredient, secondMainIngredient, combinedWith: Reagent
    let effect: Effects
}

// MARK: - ThreeReagent
struct ThreeReagent: Codable, Identifiable {
    let id = UUID()
    let firstMainIngredient, secondMainIngredient, combinedWith: Reagent
    let firstEffect, secondEffect: Effects
}

// MARK:: - BattleType
enum BattleType: String, Codable {
    case pvp = "PVP"
    case pve = "PVE"
    case both = "PVE/PVE"
}
