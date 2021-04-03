//
//  PotionsList.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 20/03/2021.
//

import SwiftUI

struct PotionsList: View {
    
    private let vm = PotionsList.ViewModel()
    @State private var searchText: String = ""
    
    init() {
        let color = UIColor(red: 133/255, green: 146/255, blue: 107/255,alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: color,
            .font : UIFont(name: "HelveticaNeue-Thin", size: 28)!
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor:color
        ]
    }
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
            
            ForEach(vm.potions.filter({self.searchText.isEmpty ? true : $0.name.lowercased().localizedStandardContains(self.searchText.lowercased()) })) { potion in
                PotionSectionItem(potion: potion)
                    .padding()
            }
        }
        .background(Color.black)
        .navigationTitle("Secret Workbench")
    }
}

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
    
    var header: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PotionsList()
    }
}
