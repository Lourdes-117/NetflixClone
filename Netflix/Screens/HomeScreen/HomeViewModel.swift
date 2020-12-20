//
//  HomeViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var movies: [String: [MovieModel]] = [:]
    let trendingNow = "Trending Now"
    init() {
        setupHomeViewModel()
    }
    
    func getAllCategories() -> [String] {
        return movies.keys.map({ String($0) })
    }
    
    func getMoviesFor(category: String) -> [MovieModel] {
        movies[category] ?? []
    }
    
    func setupHomeViewModel() {
        movies["Favourites"] = exampleMovies
        movies["RomCom"] = exampleMovies.shuffled()
        movies["Comedy"] = exampleMovies.shuffled()
        movies["Drama"] = exampleMovies.shuffled()
        movies["Sci-Fi"] = exampleMovies.shuffled()
        movies["Thrillers"] = exampleMovies.shuffled()
    }
}
