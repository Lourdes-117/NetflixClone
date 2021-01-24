//
//  MovieModel.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import Foundation

enum ShowType {
    case movie
    case tvShow
}

struct MovieModel: Identifiable {
    var id: String?
    var name: String?
    var thumbnailImage: String?
    
    var categories: [String]?
    
    var showType: ShowType {
        get {
            details?.seasons == nil ? .movie : .tvShow
        }
    }
    
    //Detail View
    var details: MovieDetailModel?
}

struct MovieDetailModel: Identifiable {
    var id: String?
    var year: Int?
    var rating: String?
    var seasons: Int?
    var resolution: String?
    var promotionHeadline: String?
    var isLiked: Bool?
    var episodeInfo: EpisodeInfo?
    var moreLikeThis: [MovieModel]?
    var trailers: [TrailerModel]?
    var episodes = exampleEpisodes
}

struct EpisodeInfo: Identifiable {
    var id: String = UUID().uuidString
    var episodeName: String?
    var description: String?
    var season: Int?
    var episode: Int?
    var creators: [String]?
    var cast: [String]?
    var videoUrl: String?
    var imageUrl: String?
    var length: Int?
}
