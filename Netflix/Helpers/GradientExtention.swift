//
//  GradientExtention.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let imageBlackOverlayGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(1)]),
        startPoint: .top,
        endPoint: .bottom)
}
