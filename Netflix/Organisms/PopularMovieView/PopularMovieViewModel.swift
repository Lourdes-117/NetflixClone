//
//  PopularMovieViewModel.swift
//  Netflix
//
//  Created by Lourdes on 2/2/21.
//

import Foundation

class PopularMovieViewModel {
    var movie: MovieModel?
    
    var thumbnailUrl: URL? {
        URL(string: movie?.thumbnailImage ?? "")
    }
    var movieName: String {
        movie?.name ?? ""
    }
}
