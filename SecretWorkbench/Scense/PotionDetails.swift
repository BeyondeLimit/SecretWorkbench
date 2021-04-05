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
    @State private var isHeaderExpanded = false
    
    init(vm: PotionDetails.ViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        ScrollView {
            header
            
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
    
    private var header: some View {
        ZStack {
            SecretColor.basic
                .cornerRadius(50)
                .frame(width: self.isHeaderExpanded ? 190 : 30, height: 65, alignment: .center)
            
            HStack {
                Image(self.vm.potion.mainEffect.rawValue)
                    .padding()
                    .background(Circle())
                    .foregroundColor(SecretColor.title)
                    .onTapGesture {
                        withAnimation() {
                            self.isHeaderExpanded.toggle()
                        }
                    }
                if self.isHeaderExpanded {
                    Text(self.vm.potion.mainEffect.rawValue)
                        .padding()
                        .font(.title)
                        .foregroundColor(SecretColor.grayedOut)
                }
            }
        }
    }
    
    @ViewBuilder
    private var levels: some View {
        ZStack {
            SecretColor.basic
                .cornerRadius(50)
                .padding()
            
            VStack {
                HStack {
                    Text("Level: ")
                        .font(.title2)
                        .foregroundColor(SecretColor.grayedOut)
                        .padding(.leading, 50)
                    
                    Image("Champion")
                        .frame(width: self.isChampion ? 50 : 0)
                        .hidden(self.isChampion)
                    
                    Text("\(self.level)")
                        .font(.title2)
                        .foregroundColor(SecretColor.grayedOut)
                    Spacer()
                }
                
                if self.isLevelExpanded {
                    ForEach(self.vm.potion.potionType) { type in
                        Button(action: {
                            self.level = "\(type.level)"
                            self.isChampion = type.isChampion
                            withAnimation() {
                                self.isLevelExpanded.toggle()
                            }
                        }, label: {
                            Image("Champion")
                                .frame(width: type.isChampion ? 50 : 0)
                                .hidden(type.isChampion)
                            Text("\(type.level)")
                        })
                        .foregroundColor(SecretColor.grayedOut)
                    }
                    .transition(AnyTransition.move(edge: .top)
                                    .combined(with: AnyTransition.opacity))
                }
            }
        }
        .onTapGesture {
            withAnimation {
                self.isLevelExpanded.toggle()
            }
        }
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
