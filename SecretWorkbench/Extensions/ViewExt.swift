//
//  ViewExt.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 21/03/2021.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundCorner(radius: radius, corners: corners))
    }
}
