//
//  MovieInfoSubHeadline.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import SwiftUI

struct MovieInfoSubHeadline: View {
    @ObservedObject var viewModel = MovieInfoSubHeadlineViewModel()
    init(details: MovieDetailModel) {
        viewModel = MovieInfoSubHeadlineViewModel(details: details)
    }
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                //Like Button Action
                viewModel.isLiked = !(viewModel.isLiked ?? false)
            }, label: {
                Image(systemName: viewModel.likeIconName)
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
            MovieInfoSubHeadline(details: exampleDetails1)
        }
    }
}
