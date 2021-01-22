//  HomeView.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    @State private var movieDetailsToShow: MovieModel? = nil
    @State private var topBarSelection: HomeTopRowTypes = .home
    @State private var selectedGenre: GenreType = .all
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                
                //Home Top RowButtons
                HomeScreenTopBarView(topBarSelectionBinding: $topBarSelection, genreBinding: $selectedGenre)
                
                VStack {
                    
                    ZStack(alignment: .top) {
                        
                        //Movie Preview
                        TopMoviePreview()
                            .frame(width: UIScreen.width)
                            .padding(.top, -50 )
                    }
                    
                    //Movie Category List
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
                                    ForEach(viewModel.getMoviesFor(category: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 200, height: 300)
                                            .padding(.horizontal, 20)
                                            .onTapGesture {
                                                movieDetailsToShow = movie
                                            }
                                    }
                                }
                            })
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            
            if let movieToShow = movieDetailsToShow {
                MovieDetailsView(movie: movieToShow, selectedMovieBinding: $movieDetailsToShow)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
