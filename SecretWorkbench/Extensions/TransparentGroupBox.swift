//
//  TransparentGroupBox.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 04/04/2021.
//

import SwiftUI

struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(SecretColor.basic))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}
