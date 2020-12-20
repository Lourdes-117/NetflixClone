//
//  RatingsView.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import SwiftUI

struct RatingsView: View {
    var viewModel = RatingsViewModel()
    init(rating: String) {
        viewModel.rating = rating
    }
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 55, height: 25)
            Text(viewModel.rating ?? "")
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }.aspectRatio(contentMode: .fit)
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: "TV-MA")
    }
}
