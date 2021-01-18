//
//  WhiteBackgroundPlayButton.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import SwiftUI

struct HorizontalButtonView: View {
    var viewModel = HorizontalButtonViewModel()
    init(backgroundColor: Color = .white, foregroundColor: Color = .black, text: String = "Play", image: String = "play.fill", action: (() -> Void)?) {
        viewModel.setValues(titleString: text, background: backgroundColor, foreground: foregroundColor, imageName: image)
        buttonTapAction = action
    }
    var buttonTapAction: (() -> Void)?
    var body: some View {
        Button(action: {
            viewModel.isOn.toggle()
            if let action = buttonTapAction {
                action()
            }
        }, label: {
            HStack {
                Spacer()
                Image(systemName: viewModel.image)
                    .font(.headline)
                Text(viewModel.title)
                    .bold()
                    .font(.system(size: 16))
                    .padding(.vertical, 8)
                Spacer()
            }.foregroundColor(viewModel.foregroundColor)
            .background(viewModel.backgroundColor)
            .cornerRadius(3.0)
        })
    }
}

struct HorizontalButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            .ignoresSafeArea(.all)
            HorizontalButtonView(backgroundColor: .white,
                                 foregroundColor: .black,
                                 text: "Play Button",
                                 image: "play.fill", action: nil)
        }
    }
}
