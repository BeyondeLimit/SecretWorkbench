//
//  SecretWorkbenchApp.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 20/03/2021.
//

import SwiftUI

@main
struct SecretWorkbenchApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PotionsList()
            }.preferredColorScheme(.dark)
        }
    }
}
