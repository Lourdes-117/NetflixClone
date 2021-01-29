//
//  ActivityIndicatorView.swift
//  Netflix
//
//  Created by Lourdes on 1/30/21.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    @Binding var animate: Bool
    
    private let spinner: UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium))
    
    func makeUIView(context: Context) -> some UIView {
        spinner.style = style
        return spinner
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let view = uiView as? UIActivityIndicatorView else { return }
        animate ? view.startAnimating() : view.stopAnimating()
    }
    
    func configure(_ indicator: (UIActivityIndicatorView) -> Void) -> some View {
        indicator(spinner)
        return self
    }
}
