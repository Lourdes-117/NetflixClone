//
//  HomeStackView.swift
//  Netflix
//
//  Created by Lourdes on 1/24/21.
//

import SwiftUI

struct HomeStackView: View {
    var viewModel = HomeStackViewModel()
    
    @Binding private var movieDetailsToShow: MovieModel?
    
    private var topRow: HomeTopRowTypes
    
    init(selectedMovieBinding: Binding<MovieModel?>, movies: [String: [MovieModel]], topRowType: HomeTopRowTypes, selectedGenre: GenreType) {
        _movieDetailsToShow = selectedMovieBinding
        viewModel.movies = movies
        viewModel.selectedGenre = selectedGenre
        topRow = topRowType
    }
    var body: some View {
        ForEach(viewModel.getAllCategories(), id: \.self) { (category)  in
            VStack {
                HStack {
                    Text(category)
                        .fontWeight(.bold)
                        .font(.title3)
                    Spacer()
                }
                .padding(.leading, 5)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(viewModel.getMoviesFor(category: category, rowType: topRow, andGenre: viewModel.selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 200, height: 300)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    movieDetailsToShow = movie
                                }
                        }
                    }
                })
            }
        }
        .foregroundColor(.white)
    }
}

//struct HomeStackView_Previews: PreviewProvider {
//    var movies: [String: [MovieModel]] = [:]
//    
//    init() {
//        movies["Favourites"] = exampleMovies
//        movies["RomCom"] = exampleMovies.shuffled()
//        movies["Comedy"] = exampleMovies.shuffled()
//        movies["Drama"] = exampleMovies.shuffled()
//        movies["Sci-Fi"] = exampleMovies.shuffled()
//        movies["Thrillers"] = exampleMovies.shuffled()
//    }
//    
//    static var previews: some View {
//        HomeStackView(selectedMovieBinding: .constant(nil), movies: movies)
//    }
//}
