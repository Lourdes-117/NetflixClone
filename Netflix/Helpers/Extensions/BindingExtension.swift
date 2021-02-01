//
//  BindingExtension.swift
//  Netflix
//
//  Created by Lourdes on 2/1/21.
//

import SwiftUI

extension Binding {
    func onChange(handler:@escaping (Value) -> Void) -> Binding<Value> {
        Binding(get: { return self.wrappedValue }) { (newValue) in
            self.wrappedValue = newValue
            handler(newValue)
        }
    }
}
