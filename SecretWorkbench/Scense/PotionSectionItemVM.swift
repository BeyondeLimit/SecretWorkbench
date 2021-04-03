//
//  PotionSectionItemVM.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 03/04/2021.
//

import Combine
extension PotionSectionItem {
    class ViewModel: ObservableObject {
        
        var potion: Potion
        
        init(potion: Potion) {
            self.potion = potion
        }
        
        func potionDescription() -> String {
            guard let amount = self.potion.potionType.last?.amount, let duration = self.potion.potionType.last?.duration else { return "" }
            return potion.potionDescription
                .replacingOccurrences(of: "%", with: "\(amount)")
                .replacingOccurrences(of: "^", with: "\(duration)")
        }
    }
}
