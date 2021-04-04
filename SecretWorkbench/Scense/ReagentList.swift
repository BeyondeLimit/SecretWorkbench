//
//  ReagentList.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 04/04/2021.
//

import SwiftUI

struct ReagentsList: View {
    
    let reagents: TwoReagent
    @State var isDetailsEnabled: Bool = false
    @State var isDetailsExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
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
            
            ZStack {
                self.reagents.effect.isPositive ? SecretColor.positiveEffect : SecretColor.negativeEffect
                
                LazyHStack(alignment: .center) {
                    Image(self.reagents.effect.rawValue)
                        .padding(.bottom, 5)
                    Text(self.reagents.effect.rawValue)
                        .foregroundColor(SecretColor.basic)
                }
            }
            .frame(maxHeight: isDetailsExpanded ? 25 : 0)
            .scaleEffect(isDetailsEnabled ? 1 : 0, anchor: .top)
        }
        .onTapGesture {
            var transaction = Transaction(animation: .easeOut)
            transaction.disablesAnimations = true
            
            withTransaction(transaction) {
                self.isDetailsEnabled.toggle()
            }
            self.isDetailsExpanded.toggle()
        }
    }
}
