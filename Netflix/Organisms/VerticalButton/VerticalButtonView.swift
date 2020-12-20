//
//  SmallVerticalButtonView.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import SwiftUI

struct VerticalButtonView: View {
    @ObservedObject var viewModel = VerticalButtonViewModel()
    var buttonClickAction: (() -> Void)?
    
    init(label: String, onStateImage: String, offStateImage: String, isOn: Bool = false, action: (()-> Void)?) {
        viewModel.setValues(labelString: label, onStateImageName: onStateImage, offStateImageName: offStateImage)
        buttonClickAction = action
    }
    
    
    var body: some View {
        Button(action: {
            viewModel.isOn = !viewModel.isOn
            if let action  = buttonClickAction {
                action()
            }
        }, label: {
            VStack {
                Image(systemName: viewModel.buttonImage ?? "")
                Text(viewModel.label)
                    .padding(.top, 5)
                    .font(.system(size: 14, weight: .bold, design: .default))
            }.foregroundColor(.white)
        })
    }
}

struct VerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VerticalButtonView(label: "My List",
                                    onStateImage: "checkmark",
                                    offStateImage: "plus",
                                    isOn: false) {
                debugPrint("Button tapped")
            }
        }
    }
}
