//
//  HomeStackViewModel.swift
//  Netflix
//
//  Created by Lourdes on 1/24/21.
//

import Foundation

class HomeStackViewModel {
    var categories: [String] = [""]
    var selectedGenre: GenreType = .all
    var movies: [String: [MovieModel]] = [:]
    
    func getAllCategories() -> [String] {
        return movies.keys.map({ String($0) })
    }
    
    func getMoviesFor(category: String, rowType homeRow: HomeTopRowTypes, andGenre genre: GenreType) -> [MovieModel] {
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({($0.showType == .tvShow) && ($0.genre == genre)})
        case .movieList:
            return (movies[category] ?? []).filter({$0.showType == .movie && ($0.genre == genre)})
        case .myList:
            //TODO: Setup My List
            return movies[category] ?? []
        }
    }
}
