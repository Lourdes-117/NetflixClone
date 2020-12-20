//
//  SmallVerticalButtonViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import Foundation

class VerticalButtonViewModel: ObservableObject {
    init() {
        label = ""
        onStateImage = ""
        offStateImage = ""
        isOn = false
    }
    func setValues(labelString: String, onStateImageName: String, offStateImageName: String, isOnBool: Bool = false) {
        label = labelString
        onStateImage = onStateImageName
        offStateImage = offStateImageName
        isOn = isOnBool
        buttonImage = isOn ? onStateImage : offStateImage
    }
    @Published var buttonImage: String?
    
    var label: String
    private var onStateImage: String
    private var offStateImage: String
    var isOn: Bool {
        didSet {
            buttonImage = isOn ? onStateImage : offStateImage
        }
    }
}
