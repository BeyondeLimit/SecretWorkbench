//
//  PotionsList.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 20/03/2021.
//

import SwiftUI

struct PotionsList: View {
    
    private let viewModel = PotionsList.ViewModel()
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
            
            ForEach(viewModel.potions.filter({self.searchText.isEmpty ? true : $0.name.lowercased().localizedStandardContains(self.searchText.lowercased()) })) { potion in
                PotionSectionItem(potion: potion)
                    .padding()
            }
        }
        .background(Color.black)
        .navigationTitle("Secret Workbench")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PotionsList()
    }
}
