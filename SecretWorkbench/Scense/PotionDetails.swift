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
    
    private let viewModel: PotionDetails.ViewModel
    @State private var level = ""
    @State private var isLevelExpanded = false
    @State private var isChampion = false
    @State private var isHeaderExpanded = false
    @State private var isToggleOn = false
    
    init(vm: PotionDetails.ViewModel) {
        self.viewModel = vm
    }
    
    var body: some View {
        ScrollView {
            header
            
            levels
            
            Text(self.viewModel.potionDescription(level: Int(level), isChampion: isChampion))
                .padding()
                .foregroundColor(SecretColor.basic)
            
            effectsToggle
            
            reagentsList
        }
        .background(Color.black)
        .navigationBarTitle(self.viewModel.potion.name, displayMode: .automatic)
        .foregroundColor(SecretColor.title)
        .onAppear() {
            withAnimation(Animation.linear.delay(0.5) ) {
                self.isHeaderExpanded.toggle()
            }
        }
    }
    
    private var header: some View {
        ZStack {
            SecretColor.basic
                .cornerRadius(50)
                .frame(width: self.isHeaderExpanded ? 190 : 30, height: 65, alignment: .center)
            
            HStack {
                Image(self.viewModel.potion.mainEffect.rawValue)
                    .padding()
                    .background(Circle())
                    .foregroundColor(SecretColor.title)
                
                if self.isHeaderExpanded {
                    Text(self.viewModel.potion.mainEffect.rawValue)
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
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            VStack {
                HStack {
                    Text("Level: ")
                        .font(.title2)
                        .foregroundColor(SecretColor.grayedOut)
                        .padding()
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
                    ForEach(self.viewModel.potion.potionType) { type in
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
                                .font(.title2)
                        })
                        .foregroundColor(SecretColor.grayedOut)
                    }
                    .transition(AnyTransition.move(edge: .top)
                                    .combined(with: AnyTransition.opacity))
                }
            }
        }
        .frame(height: isLevelExpanded ? .infinity : 50)
        .padding(.top)
        .onTapGesture {
            withAnimation {
                self.isLevelExpanded.toggle()
            }
        }
    }
    
    private var effectsToggle: some View {
        Toggle(isOn: self.$isToggleOn) {
            Text(self.isToggleOn ? EffectsToogleName.triple.rawValue : EffectsToogleName.two.rawValue)
                .font(.title)
                .foregroundColor(self.isToggleOn ? SecretColor.positiveEffect : SecretColor.grayedOut)
                .padding(.leading, 30)
                .padding(.top, 10)
                .padding(.bottom, 10)
        }
        .background(SecretColor.basic)
        .cornerRadius(50)
        .padding(.all, 10)
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
            ForEach(isToggleOn ? self.viewModel.potion.threeReagents : self.viewModel.potion.twoReagents) { reagents in
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
