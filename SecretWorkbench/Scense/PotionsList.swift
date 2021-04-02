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
                PoitionSectionItem(potion: potion)
                    .padding()
            }
        }
        .background(Color.black)
        .navigationTitle("Secret Workbench")
    }
}

struct PoitionSectionItem: View {
    
    var potion: Potion
    
    var body: some View {
        NavigationLink(destination: PotionDetails(vm: PotionDetails.ViewModel(potion: self.potion))) {
            LazyVStack {
                GroupBox(label: header) {
                    Text(potion.potionDescription)
                        .foregroundColor(.white)
                }
            }
            .shadow(radius: 15)
        }
    }
    
    var header: some View {
        ZStack {
            Rectangle()
                .cornerRadius(25.0, corners: .allCorners)
                .foregroundColor(.gray)
            HStack(alignment: .center) {
                Image("\(potion.image)")
                    .overlay(RoundedRectangle(cornerRadius: 50, style: .continuous)
                                .stroke(Color.black, lineWidth: 0.5))
                    .padding()
                    .layoutPriority(2)
                Spacer()
                Text(potion.name)
                    .foregroundColor(.white)
                    .layoutPriority(3)
                Spacer()
                Text(potion.battleType.rawValue)
                    .foregroundColor(.white)
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
