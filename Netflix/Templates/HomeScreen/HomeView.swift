//  HomeView.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            HomeScreenTopBarView()
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack(alignment: .top) {
                        TopMoviePreview()
                            .frame(width: UIScreen.width)
                            .padding(.top, -50 )
                    }
                    ForEach(viewModel.getAllCategories(), id: \.self) { (category)  in
                        VStack {
                            HStack {
                                Text(category)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Spacer()
                            }
                            .padding(.leading, 5)
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack {
                                    ForEach(viewModel.getMoviesFor(category: category)) { movies in
                                        StandardHomeMovie(movie: movies)
                                            .frame(width: 200, height: 300)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            })
                        }
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
