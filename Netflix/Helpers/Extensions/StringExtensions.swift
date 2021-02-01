//
//  StringExtentions.swift
//  Netflix
//
//  Created by Lourdes on 12/24/20.
//

import Foundation
import SwiftUI

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttribute = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttribute)
        return size.width
    }
}
