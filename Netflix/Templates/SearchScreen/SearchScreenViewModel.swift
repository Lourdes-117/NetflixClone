//
//  SearchScreenViewModel.swift
//  Netflix
//
//  Created by Lourdes on 2/1/21.
//

import Foundation

enum ViewState {
    case empty
    case loading
    case ready
    case error
}

class SearchScreenViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var viewState: ViewState = .ready
    @Published var isShowingPopularMovies: Bool = true
    
    @Published var popularMovies: [MovieModel] = []
    @Published var searchResults: [MovieModel] = []
    
    init() {
        getPopularMovies()
    }
    
    
    
    func updateSearchText(_ text: String) {
        setViewState(to: .loading)
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResultsForText(text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
    private func getPopularMovies() {
        popularMovies = generateMovies(40)
    }
    
    func getSearchResultsForText(_ text: String) {
        
        let randomResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if randomResult == 0 {
                self?.searchResults = []
                self?.setViewState(to: .empty)
            } else {
                self?.searchResults = generateMovies(12)
                self?.setViewState(to: .ready)
            }
        }
    }
    
    func setViewState(to state: ViewState) {
        viewState = state
        isLoading = state == .loading
    }
}
