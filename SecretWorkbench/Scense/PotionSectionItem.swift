//
//  PotionSectionItem.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 04/04/2021.
//

import SwiftUI

struct PotionSectionItem: View {
    
    private var vm: PotionSectionItem.ViewModel
    
    init(potion: Potion) {
        self.vm = PotionSectionItem.ViewModel(potion: potion)
    }
    
    var body: some View {
        NavigationLink(destination: PotionDetails(vm: PotionDetails.ViewModel(potion: self.vm.potion))) {
            ZStack {
                SecretColor.cellGreayed
                    .cornerRadius(30)
                    .shadow(radius: 30)
                
                LazyVStack {
                    header
                    Text(self.vm.potionDescription())
                        .padding()
                        .foregroundColor(SecretColor.basic)
                }
            }
        }
    }
    
    private var header: some View {
        ZStack {
            Rectangle()
                .cornerRadius(25.0, corners: .allCorners)
                .foregroundColor(SecretColor.basic)
            HStack(alignment: .center) {
                Image("\(self.vm.potion.image)")
                    .padding()
                    .layoutPriority(2)
                Spacer()
                Text(self.vm.potion.name)
                    .foregroundColor(SecretColor.grayedOut)
                    .layoutPriority(3)
                Spacer()
                Text(self.vm.potion.battleType.rawValue)
                    .foregroundColor(SecretColor.grayedOut)
                    .padding()
                    .layoutPriority(2)
            }
        }
    }
}
