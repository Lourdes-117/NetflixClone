//
//  TopMoviePreviewViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/15/20.
//

import Foundation

class TopMoviePreviewViewModel: ObservableObject {
    @Published var movie: MovieModel?
    
    init() {
        setMovie(exampleMovie1)
        print("Check")
    }
    
    func setMovie(_ movieModel: MovieModel) {
        movie = movieModel
    }
    
    var thumbnailImage: String {
        movie?.thumbnailImage ?? ""
    }
    
    var categories: [String] {
        movie?.categories ?? []
    }
}
