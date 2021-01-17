//
//  MoreLikeThisGridViewModel.swift
//  Netflix
//
//  Created by Lourdes on 1/16/21.
//

import Foundation

class MoreLikeThisGridViewModel {
    var movies: [MovieModel] = []
    var moviesCount: Int{
        movies.count
    }
    
    func getMovieAtIndex(_ index: Int) -> MovieModel {
        if index > moviesCount { return MovieModel(id: nil, name: nil, thumbnailImage: nil, categories: nil, details: nil) }
        return movies[index]
    }
}
