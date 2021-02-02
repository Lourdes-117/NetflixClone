//
//  SearchScreen.swift
//  Netflix
//
//  Created by Lourdes on 1/30/21.
//

import SwiftUI

struct SearchScreen: View {
    @ObservedObject private var viewModel = SearchScreenViewModel()
    
    @State private var searchKey: String = ""
    @State private var isEditting: Bool = true
    
    @State private var movieDetailToShow: MovieModel? = nil
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                SearchBarView(searchKey: $searchKey.onChange(handler: viewModel.updateSearchText),
                          isEditting: $isEditting,
                          isLoading: $viewModel.isLoading)
                    .padding(.top, 10)
                    .animation(.easeInOut(duration: 0.25))
                ScrollView {
                    if viewModel.isShowingPopularMovies {
                        PopularMoviesView(movies: viewModel.popularMovies,
                                          movieDetailToShow: $movieDetailToShow)
                    } else {
                        switch viewModel.viewState {
                        case .ready:
                            HStack {
                                Text("Movies & TV")
                                    .bold()
                                    .padding(.leading, 10)
                                    .font(.title3)
                                Spacer()
                            }
                            SearchResultsView(movies: viewModel.searchResults,
                                              movieToShow: $movieDetailToShow)
                        case .empty:
                            Text("Your Search Does Not Have Any Results")
                                .padding(.top, 150)
                        default:
                            Text("")
                        }
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
            
            if let movieDetail = movieDetailToShow {
                MovieDetailsView(movie: movieDetail,
                                 selectedMovieBinding: $movieDetailToShow)
            }
        }
    }
}

struct PopularMoviesView: View {
    var movies: [MovieModel]
    
    @Binding var movieDetailToShow: MovieModel?
    
    var body: some View {
        LazyVStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .padding(.leading, 10)
                    .font(.title3)
                Spacer()
            }
            
            ForEach(movies) { (movie) in
                PopularMovieView(movie: movie,
                                 movieDetailBinding: $movieDetailToShow)
                    .frame(height: 75)
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
