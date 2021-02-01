//
//  PopularMovieView.swift
//  Netflix
//
//  Created by Lourdes on 2/2/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularMovieView: View {
    var viewModel = PopularMovieViewModel()
        
    @Binding private var movieDetailToShow: MovieModel?
    
    init(movie: MovieModel?, movieDetailBinding: Binding<MovieModel?>) {
        viewModel.movie = movie
        _movieDetailToShow = movieDetailBinding
    }
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(viewModel.thumbnailUrl)
                    .resizable()
                    .frame(width: proxy.size.width / 3, height: 75)
                    .aspectRatio(1.5, contentMode: .fit)
                    .padding(.leading, 3)
                
                Text(viewModel.movieName)
                    .padding(.leading, 8)
                
                Spacer()
                
                Button(action: {
                    //OnTap Play Button
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 8)
            }
            .foregroundColor(.white)
            .onTapGesture {
                movieDetailToShow = viewModel.movie
            }
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            PopularMovieView(movie: exampleMovie1, movieDetailBinding: .constant(nil))
        }
    }
}
