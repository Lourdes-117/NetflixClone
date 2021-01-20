//
//  MovieDetailsViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    var model: MovieModel?
    init() { }
    init(movie: MovieModel) {
        model = movie
    }
    
    var numberOfSeasons: Int {
        return movie.details?.episodes.last?.season ?? 0
    }
    
    func getEpisodeFromSeason(_ season: Int) -> EpisodeInfo {
        return movie.details?.episodes[season] ?? EpisodeInfo(id: "",
                                                              episodeName: nil,
                                                              description: nil,
                                                              season: nil,
                                                              episode: nil,
                                                              creators: nil,
                                                              cast: nil,
                                                              videoUrl: nil,
                                                              imageUrl: nil,
                                                              length: nil)
    }
    
    var details: MovieDetailModel {
        return model?.details ?? MovieDetailModel()
    }
    
    var movie: MovieModel {
        return model ?? MovieModel()
    }
    
    var promotionHeadline: String? {
        return model?.details?.promotionHeadline
    }
    
    var episodeInformationTitle: String? {
        if let season = model?.details?.episodeInfo?.season,
           let episode = model?.details?.episodeInfo?.episode,
           let title = model?.details?.episodeInfo?.episodeName {
            return "S\(season):E\(episode) \(title)"
        }
        return nil
    }
    
    var episodeDescription: String {
        return model?.details?.episodeInfo?.description ?? ""
    }
    
    var creators: String? {
        guard let creators = model?.details?.episodeInfo?.creators else { return nil }
        var creatorString: String = creators.count > 1 ? "Creators: " : "Creator: "
        creators.forEach { (creator) in
            creatorString.append(creator)
            if !isLastElement(creator, inArray: creators) { creatorString.append(", ") }
        }
        return creatorString
    }
    
    var cast: String? {
        guard let casts = model?.details?.episodeInfo?.cast else { return nil }
        var castString: String = casts.count > 1 ? "Creators: " : "Creator: "
        casts.forEach { (cast) in
            castString.append(cast)
            if !isLastElement(cast, inArray: casts) { castString.append(", ") }
        }
        return castString
    }
}
