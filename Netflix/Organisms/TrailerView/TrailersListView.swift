//
//  TrailerView.swift
//  Netflix
//
//  Created by Lourdes on 1/18/21.
//

import SwiftUI

struct TrailersListView: View {
    let viewModel = TrailersListViewModel()
    init(trailers: [TrailerModel]) {
        viewModel.trailers = trailers
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.trailers) { trailer in
                VideoPreviewContainer(imageUrl: trailer.thumbnailImageUrl ?? "", videoUrl: trailer.videoURl ?? "")
                    .frame(width: UIScreen.width, height: 200)
                Text(trailer.name ?? "")
            }
        }
        .foregroundColor(.white)
    }
}

struct TrailersListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
        TrailersListView(trailers: exampleTrailers)
        }
    }
}
