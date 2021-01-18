//
//  VideoPreviewContainer.swift
//  Netflix
//
//  Created by Lourdes on 1/17/21.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewContainer: View {
    private let viewModel = VideoPreviewContainerViewModel()
    
    @State private var showVideoPlayer = false
    
    init(imageUrl: String, videoUrl: String) {
        viewModel.imageUrl = imageUrl
        viewModel.videoUrl = videoUrl
    }
    var body: some View {
        ZStack {
            KFImage(URL(string: viewModel.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
            Button(action: {
                showVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showVideoPlayer, content: {
                VideoView(videoUrl: viewModel.videoUrl)
            })
        }
        .frame(maxWidth: UIScreen.width, maxHeight: 250)
    }
}

struct VideoPreviewContainer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewContainer(imageUrl: exampleImageUrl_300_100, videoUrl: exampleVideoUrl)
    }
}
