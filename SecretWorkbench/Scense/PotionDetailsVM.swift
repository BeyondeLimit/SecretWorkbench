//
//  PotionDetailsVM.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 02/04/2021.
//

import Combine

extension PotionDetails {
    class ViewModel: ObservableObject {
        @Published var potion: Potion
        
        func potionDescription(level: Int?, isChampion: Bool) -> String {
            guard let selectedPotion = potion.potionType
                    .first(where: {$0.isChampion == isChampion && $0.level == level}) else { return "" }
            
            return potion.potionDescription
                .replacingOccurrences(of: "%", with: "\(selectedPotion.amount)")
                .replacingOccurrences(of: "^", with: "\(selectedPotion.duration)")
        }
        
        init(potion: Potion) {
            self.potion = potion
        }
    }
}
