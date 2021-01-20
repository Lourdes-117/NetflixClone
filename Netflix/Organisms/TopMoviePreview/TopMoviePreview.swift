//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by Lourdes on 12/14/20.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    @ObservedObject var viewModel = TopMoviePreviewViewModel()
    var body: some View {
        ZStack {
            KFImage(URL(string: viewModel.thumbnailImage))
                .resizable()
                .scaledToFill()
                .clipped(antialiased: true)
                .overlay(LinearGradient.imageBlackOverlayGradient
                            .padding(.top, UIScreen.height/2))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    ForEach(viewModel.categories, id: \.self) { category in
                        Text(category)
                        if !isLastElement(category, inArray: viewModel.categories) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 4))
                        }
                    }
                }
                TopMoviePreviewBottomButtonList()
                    .padding(.top, 10)
            }.foregroundColor(.white)
            .frame(width: UIScreen.width)
        }
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview()
    }
}
