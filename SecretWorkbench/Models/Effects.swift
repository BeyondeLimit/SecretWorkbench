//
//  Effects.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 30/03/2021.
//

import Foundation

// MARK: - Effects
enum Effects: String, Codable {
    case increaseSpellPower = "Increase Spell Power"
    case protection = "Protection"
    case ravageHealth = "Ravage Health"
    case ravageMagicka = "Ravage Magicka"
    case vitality = "Vitality"
    case restoreMagica = "Restore Magicka"
    case increaseArmor = "Increase Armor"
    case spellCritical = "Spell Critical"
}
