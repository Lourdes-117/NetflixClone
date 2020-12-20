//
//  VideoResolutionView.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import SwiftUI

struct VideoResolutionView: View {
    var viewModel = VideoResolutionViewModel()
    init(videoResolution: VideoResolution) {
        viewModel = VideoResolutionViewModel(videoResolution: .hd)
    }
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .border(Color.gray, width: 3)
                .cornerRadius(5)
            Text(viewModel.videoResolution)
        }
        .frame(width: 40, height: 30)
        .foregroundColor(.white)
    }
}

struct VideoResolutionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VideoResolutionView(videoResolution: .fourK)
        }
    }
}
