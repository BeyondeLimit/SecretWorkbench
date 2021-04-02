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
            Image(self.vm.potion.image)
                .padding()
                .background(Circle())
                .foregroundColor(SecretColor.basic)
            
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
                combination(of: reagents)
                Divider()
                    .background(SecretColor.basic)
            }
        }
    }
    
    private func combination(of reagents: TwoReagent) -> some View {
        HStack(spacing: 10) {
            VStack {
                Image(reagents.firstMainIngredient.rawValue)
                Text(reagents.firstMainIngredient.rawValue)
                    .font(.caption)
                    .fontWeight(.heavy)
            }.frame(maxWidth: .infinity)
            
            VStack {
                Image(reagents.secondMainIngredient.rawValue)
                Text(reagents.secondMainIngredient.rawValue)
                    .font(.caption)
                    .fontWeight(.heavy)
            }.frame(maxWidth: .infinity)
            
            HStack {
                Divider()
                    .background(SecretColor.basic)
            }
            
            VStack {
                Image(reagents.combinedWith.rawValue)
                Text(reagents.combinedWith.rawValue)
                    .font(.caption)
                    .fontWeight(.heavy)
            }.frame(maxWidth: .infinity)
        }.padding()
    }
}

struct PotionDetails_Previews: PreviewProvider {
    static var previews: some View {
        PotionDetails(vm: PotionDetails.ViewModel(potion: Bundle(for: PotionsList.ViewModel.self).decode(MainResponse.self, from: "poitions").potion[0]))
    }
}


struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(SecretColor.basic))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}
