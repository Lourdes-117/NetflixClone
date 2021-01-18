//
//  TrailerModel.swift
//  Netflix
//
//  Created by Lourdes on 1/17/21.
//

import Foundation

struct TrailerModel: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String?
    var videoURl: String?
    var thumbnailImageUrl: String?
}
