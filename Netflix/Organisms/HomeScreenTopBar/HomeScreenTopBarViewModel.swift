//
//  HomeScreenTopBarViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/16/20.
//

import Foundation

enum HomeTopRowTypes: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movieList = "Movies"
    case myList = "My List"
}

enum GenreType: String {
    case tvShows = "TV Shows"
    case horror = "Horror"
    case thriller = "Thriller"
    case comedy = "Comedy"
    case mystery = "Mystery"
    case all = "All Genres"
}

class HomeScreenTopBarViewModel {
    let logoImageName = "netflix_logo"
}
