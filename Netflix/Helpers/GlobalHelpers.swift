//
//  GlobalHelpers.swift
//  Netflix
//
//  Created by Lourdes on 12/20/20.
//

import Foundation
func isLastElement <T: Equatable> (_ element: T, inArray array: [T]) -> Bool {
    return element == array.last
}
