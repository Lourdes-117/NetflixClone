//
//  SearchResultsView.swift
//  Netflix
//
//  Created by Lourdes on 2/2/21.
//

import SwiftUI

struct SearchResultsView: View {
    var movies: [MovieModel]
    
    @Binding var movieToShow: MovieModel?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .onTapGesture {
                        movieToShow = movie
                    }
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(movies: exampleMovies, movieToShow: .constant(nil))
    }
}
