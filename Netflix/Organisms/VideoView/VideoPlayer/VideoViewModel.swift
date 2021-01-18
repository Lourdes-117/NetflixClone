//
//  VideoViewModel.swift
//  Netflix
//
//  Created by Lourdes on 1/17/21.
//

import Foundation

class videoViewModel {
    var videoUrl = ""
    func getUrl() -> URL? {
        return URL(string: videoUrl)
    }
}
