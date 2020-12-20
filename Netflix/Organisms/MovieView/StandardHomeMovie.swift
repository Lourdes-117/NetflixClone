//
//  StandardHomeMovie.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    var movie: MovieModel
    var body: some View {
        VStack {
            KFImage(URL(string: movie.thumbnailImage ?? ""))
                .resizable()
//            Text(movie.name ?? "")
//                .fontWeight(.semibold)
//                .frame(height: 15)
        }
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
