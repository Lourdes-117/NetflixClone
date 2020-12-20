//
//  VideoResolutionViewModel.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import Foundation

enum VideoResolution: String {
    case hd = "HD"
    case sd = "SD"
    case fourK = "4K"
}

class VideoResolutionViewModel {
    private var resolution: VideoResolution?
    init() { }
    init(videoResolution: VideoResolution) {
        resolution = videoResolution
    }
    var videoResolution: String {
        guard let resolution = resolution else { return "" }
        switch resolution {
        case .hd:
            return "HD"
        case .sd:
            return "SD"
        case .fourK:
            return "4K"
        }
    }
}
