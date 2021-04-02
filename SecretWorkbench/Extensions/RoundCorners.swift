//
//  RoundCorners.swift
//  SecretWorkbench
//
//  Created by Arseny Mamikonyan on 21/03/2021.
//

import Foundation
import SwiftUI

struct RoundCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: self.corners, cornerRadii: CGSize(width: self.radius, height: self.radius))
        return Path(path.cgPath)
    }
}
