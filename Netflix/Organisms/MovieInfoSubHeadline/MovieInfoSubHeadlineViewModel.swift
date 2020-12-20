//
//  MovieInfoSubHeadlineViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import Foundation

class MovieInfoSubHeadlineViewModel: ObservableObject {
    init() { }
    init(details: MovieDeailModel?) {
        model = details
        isLiked = model?.isLiked
    }
    
    private var model: MovieDeailModel?
    
    var year: String {
        guard let year = model?.year else {
            return ""
        }
        return String(year)
    }
    
    var ratings: String {
        guard let ratings = model?.rating else {
            return ""
        }
        return String(ratings.uppercased())
    }
    
    var seasons: String {
        guard let seasons = model?.seasons, seasons > 0 else {
            return ""
        }
        return "\(seasons) \(seasons>1 ? "Seasons" : "Season")"
    }
    
    var isLiked: Bool? {
        didSet {
            likeIconName = isLiked ?? false ? "hand.thumbsup.fill" : "hand.thumbsup"
        }
        
    }
    
    var resolution: VideoResolution? {
        guard let resolution = model?.resolution else { return nil }
        return VideoResolution(rawValue: resolution)
    }
    
    @Published var likeIconName: String = "hand.thumbsup"
}
