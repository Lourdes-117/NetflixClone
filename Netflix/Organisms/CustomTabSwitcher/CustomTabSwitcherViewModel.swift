//
//  CustomTabViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/24/20.
//

import Foundation

enum CustomTabStates: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

class CustomTabSwitcherViewModel: ObservableObject {
    var tabs: [CustomTabStates] = []
    var movie: MovieModel?
    var moreLikeThis: [MovieModel] {
        return movie?.details?.moreLikeThis ?? [MovieModel(id: nil, name: nil, thumbnailImage: nil, categories: nil, details: nil)]
    }
    var trailers: [TrailerModel] {
        return movie?.details?.trailers ?? [TrailerModel(name: nil, videoURl: nil, thumbnailImageUrl: nil)]
    }
}
