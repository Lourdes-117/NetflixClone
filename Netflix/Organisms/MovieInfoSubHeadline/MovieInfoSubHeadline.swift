//
//  MovieInfoSubHeadline.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import SwiftUI

struct MovieInfoSubHeadline: View {
    @ObservedObject var viewModel = MovieInfoSubHeadlineViewModel()
    init(details: MovieDetailModel, isLiked: Binding<Bool>) {
        _isLiked = isLiked
        viewModel = MovieInfoSubHeadlineViewModel(details: details)
    }
    
    @Binding private var isLiked: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                //Like Button Action
                isLiked.toggle()
            }, label: {
                Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                    .font(.system(size: 22))
            })
            .padding(.trailing, 3)
            
            Text(viewModel.year)
            
            RatingsView(rating: viewModel.ratings)
            
            Text(viewModel.seasons)
            if let resolution = viewModel.resolution {
                VideoResolutionView(videoResolution: resolution)
            }
        }
        .foregroundColor(.gray)
        .padding(.top, 8)
    }
}

struct MovieInfoSubHeadline_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MovieInfoSubHeadline(details: exampleDetails1, isLiked: .constant(false))
        }
    }
}
