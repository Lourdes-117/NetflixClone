//
//  VideoView.swift
//  Netflix
//
//  Created by Lourdes on 1/17/21.
//

import SwiftUI
import AVKit

struct VideoView: View {
    private let viewModel = videoViewModel()
    init(videoUrl: String) {
        viewModel.videoUrl = videoUrl
    }
    
    var body: some View {

        if let url = viewModel.getUrl() {
            VideoPlayer(player: AVPlayer(url: url))
        } else {
            Text("AV Player")
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoUrl: exampleVideoUrl)
    }
}
