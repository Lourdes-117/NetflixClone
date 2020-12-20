//
//  HorizontalButtonViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import Foundation
import SwiftUI

class HorizontalButtonViewModel: ObservableObject {
    var title: String = ""
    var image: String = ""
    var backgroundColor: Color = .white
    var foregroundColor: Color = .black
    var isOn: Bool = false
    
    func setValues(titleString: String, background: Color, foreground: Color, imageName: String) {
        title = titleString
        backgroundColor = background
        foregroundColor = foreground
        image = imageName
    }
}
