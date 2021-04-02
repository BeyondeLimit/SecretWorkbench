//
//  PoitionDetails.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 30/03/2021.
//

import Foundation
import SwiftUI
import Combine


struct PotionDetails: View {
    
    var body: some View {
        Text("Poition Details!")
    }
}


extension PotionDetails {
    class ViewModel: ObservedObject {
        let poition: Potion
    }
}
