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
    case restoreMagicka = "Restore Magicka"
    case increaseArmor = "Increase Armor"
    case spellCritical = "Spell Critical"
    case breach = "Breach"
    case creepingRaveHealth = "Creeping Ravage Health"
    case defile = "Defile"
    case detection = "Detection"
    case invisible = "Invisible"
    case lowerArmor = "Lower Armor"
    case lowerSpellCrit = "Lower Spell Crit"
    case lowerSpellPower = "Lower Spell Power"
    case lowerWeaponCrit = "LowerWeaponCrit"
    case lowerWeaponPower = "Lower Weapon Power"
    case reduceSpeed = "Reduce Speed"
    case restoreStamina = "Restore Stamina"
    case restoreHealth = "Restore Health"
    case speed = "Speed"
    case sustainedRestoreHealth = "Sustained Restore Health"
    case unstoppable = "Unstoppable"
    case vulnerability = "Vulnerability"
    case weaponCrit = "Weapon Crit"
}

extension Effects {
    var isPositive: Bool {
        switch self {
        case .ravageHealth, .ravageMagicka: return false
        default: return true
        }
    }
    
    func getDescription(level: Int) -> String {
        switch self {
        case .increaseSpellPower:
            <#code#>
        default:
            return "-"
        }
    }
    
    private func getSeconds() -> String {
        
    }
}
