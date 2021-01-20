//
//  EpisodeViewModel.swift
//  Netflix
//
//  Created by Lourdes on 1/19/21.
//

import Foundation

class EpisodeViewModel {
    var episodes: [EpisodeInfo] = []
    
    func getEpisodes(forSeason season: Int) -> [EpisodeInfo] {
        return episodes.filter({$0.season == season})
    }
}
