//
//  ReagentList.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 04/04/2021.
//

import SwiftUI

struct ReagentsList: View {
    
    let reagents: Reagents
    @State private var isDetailsEnabled: Bool = false
    @State private var isDetailsExpanded: Bool = false
    
    var body: some View {
        return VStack(spacing: 0) {
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
                }.frame(maxHeight: .infinity)
                
                VStack {
                    Image(reagents.combinedWith.rawValue)
                    Text(reagents.combinedWith.rawValue)
                        .font(.caption)
                        .fontWeight(.heavy)
                }.frame(maxWidth: .infinity)
            }.padding()
            
            effect
        }
        .onTapGesture {
            withAnimation() {
                self.isDetailsExpanded.toggle()
            }
        }
    }
    
    @ViewBuilder
    private var effect: some View {
        if self.isDetailsExpanded {
            VStack {
                ZStack {
                    (self.reagents.firstEffect.isPositive ? SecretColor.positiveEffect : SecretColor.negativeEffect)
                    LazyVStack {
                        LazyHStack(alignment: .center) {
                            Image(self.reagents.firstEffect.rawValue)
                            Text(self.reagents.firstEffect.rawValue)
                                .foregroundColor(SecretColor.basic)
                        }
                        Text("Grants you Major Vitality, increasing your healing taken by 30% for 35 seconds.")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                if let effect = self.reagents.secondEffect {
                    ZStack {
                        (effect.isPositive ? SecretColor.positiveEffect : SecretColor.negativeEffect)
                        LazyVStack {
                            LazyHStack(alignment: .center) {
                                Image(effect.rawValue)
                                Text(effect.rawValue)
                                    .foregroundColor(SecretColor.basic)
                            }
                            Text("Grants you Major Vitality, increasing your healing taken by 30% for 35 seconds.")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .frame(height: .infinity)
            .transition(AnyTransition.move(edge: .top)
                            .combined(with: AnyTransition.opacity))
        }
    }
}
