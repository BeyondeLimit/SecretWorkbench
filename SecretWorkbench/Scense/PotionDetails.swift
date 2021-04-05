//
//  PotionDetails.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 30/03/2021.
//

import Foundation
import SwiftUI
import Combine


struct PotionDetails: View {
    
    private let vm: PotionDetails.ViewModel
    @State private var level = ""
    @State private var isLevelExpanded = false
    @State private var isChampion = false
    
    init(vm: PotionDetails.ViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                SecretColor.basic
                    .cornerRadius(50)
                    .frame(width: 190, height: 65, alignment: .center)
                HStack {
                    Image(self.vm.potion.mainEffect.rawValue)
                        .padding()
                        .background(Circle())
                        .foregroundColor(SecretColor.title)
                    
                    Text(self.vm.potion.mainEffect.rawValue)
                        .padding()
                        .font(.title)
                        .foregroundColor(SecretColor.grayedOut)
                }
            }
            
            levels
            
            Text(self.vm.potionDescription(level: Int(level), isChampion: isChampion))
                .padding()
                .foregroundColor(SecretColor.basic)
            
            reagentsList
        }
        .background(Color.black)
        .navigationBarTitle(self.vm.potion.name, displayMode: .automatic)
        .foregroundColor(SecretColor.title)
    }
    
    private var levels: some View {
        GroupBox {
            DisclosureGroup("Level: \(self.level)", isExpanded: self.$isLevelExpanded) {
                ForEach(self.vm.potion.potionType) { type in
                    Button("\(type.level)") {
                        self.level = "\(type.level)"
                        self.isChampion = type.isChampion
                        self.isLevelExpanded.toggle()
                    }
                }
            }
            .foregroundColor(SecretColor.grayedOut)
            .accentColor(SecretColor.grayedOut)
            .font(.title2)
        }
        .groupBoxStyle(TransparentGroupBox())
        .padding()
    }
    
    private var reagentsList: some View {
        VStack(alignment: .center, spacing: 5) {
            HStack {
                Spacer()
                Text("Main reagents")
                    .padding()
                Spacer()
                Text("Combine with")
                    .padding()
            }
            ForEach(self.vm.potion.twoReagents) { reagents in
                ReagentsList(reagents: reagents)
                Divider()
                    .background(SecretColor.basic)
            }
        }
    }
    
    
}

struct PotionDetails_Previews: PreviewProvider {
    static var previews: some View {
        PotionDetails(vm: PotionDetails.ViewModel(potion: Bundle(for: PotionsList.ViewModel.self).decode(MainResponse.self, from: "poitions").potion[0]))
    }
}



