//
//  HomeStackViewModel.swift
//  Netflix
//
//  Created by Lourdes on 1/24/21.
//

import Foundation

class HomeStackViewModel {
    var categories: [String] = [""]
    var movies: [String: [MovieModel]] = [:]
    
    func getAllCategories() -> [String] {
        return movies.keys.map({ String($0) })
    }
    
    func getMoviesFor(category: String, rowType homeRow: HomeTopRowTypes) -> [MovieModel] {
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({$0.showType == .tvShow})
        case .movieList:
            return (movies[category] ?? []).filter({$0.showType == .movie})
        case .myList:
            //TODO: Setup My List
            return movies[category] ?? []
        }
    }
}
