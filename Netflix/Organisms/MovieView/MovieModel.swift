//
//  MovieModel.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import Foundation

struct MovieModel: Identifiable {
    var id: String?
    var name: String?
    var thumbnailImage: String?
    
    var categories: [String]?
    
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
    var moreLikeThis: [MovieModel]
}

struct EpisodeInfo {
    var episodeName: String?
    var description: String?
    var season: Int?
    var episode: Int?
    var creators: [String]?
    var cast: [String]?
}
