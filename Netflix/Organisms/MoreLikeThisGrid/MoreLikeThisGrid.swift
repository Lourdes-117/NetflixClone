//
//  MoreLikeThisGrid.swift
//  Netflix
//
//  Created by Lourdes on 1/14/21.
//

import SwiftUI
import KingfisherSwiftUI
 
struct MoreLikeThisGrid: View {
    let viewModel = MoreLikeThisGridViewModel()
    
    init(movies: [MovieModel]) {
        viewModel.movies = movies
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns ) {
            ForEach(0..<viewModel.moviesCount) { index in
                StandardHomeMovie(movie: viewModel.getMovieAtIndex(index))
                    .frame(height: 200)
            }
        }
    }
}

struct MoreLikeThisGrid_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThisGrid(movies: exampleMovies)
    }
}
