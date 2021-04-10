//
//  PotionSectionItem.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 04/04/2021.
//

import SwiftUI

struct PotionSectionItem: View {
    
    private var viewModel: PotionSectionItem.ViewModel
    
    init(potion: Potion) {
        self.viewModel = PotionSectionItem.ViewModel(potion: potion)
    }
    
    var body: some View {
        NavigationLink(destination: PotionDetails(vm: PotionDetails.ViewModel(potion: self.viewModel.potion))) {
            ZStack {
                SecretColor.cellGreayed
                    .cornerRadius(30)
                    .shadow(radius: 30)
                
                LazyVStack {
                    header
                    Text(self.viewModel.potionDescription())
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
                Image("\(self.viewModel.potion.image)")
                    .padding()
                    .layoutPriority(2)
                Spacer()
                Text(self.viewModel.potion.name)
                    .foregroundColor(SecretColor.grayedOut)
                    .layoutPriority(3)
                Spacer()
                Text(self.viewModel.potion.battleType.rawValue)
                    .foregroundColor(SecretColor.grayedOut)
                    .padding()
                    .layoutPriority(2)
            }
        }
    }
}
