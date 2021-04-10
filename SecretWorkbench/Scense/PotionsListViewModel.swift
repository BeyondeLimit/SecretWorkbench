//
//  PotionsListViewModel.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 02/04/2021.
//

import Combine
import UIKit

extension PotionsList {
    class ViewModel: ObservableObject {
        @Published var potions: [Potion] = []
        
        init() {
            potions = Bundle(for: PotionsList.ViewModel.self).decode(MainResponse.self, from: "poitions").potion
        }
    }
}
