//
//  TopMoviePreviewBottomButtonList.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import SwiftUI

struct TopMoviePreviewBottomButtonList: View {
    var body: some View {
        HStack {
            
            Spacer()
            
            VerticalButtonView(label: "My List", onStateImage: "checkmark", offStateImage: "plus") {
                //Action on Tapping My List Button
            }
            
            Spacer()
            
            HorizontalButtonView(backgroundColor: .white, foregroundColor: .black, text: "Play", image: "play.fill") {
                //Action on Tapping Play Button
            }
            .frame(width: UIScreen.width/3)
            
            Spacer()
            
            VerticalButtonView(label: "Info", onStateImage: "info.circle", offStateImage: "info.circle") {
                //Action On Tapping Info Button
            }
            
            Spacer()
            
            
        }.foregroundColor(.white)
    }
}

struct TopMoviePreviewBottomButtonList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TopMoviePreviewBottomButtonList()
        }
    }
}
