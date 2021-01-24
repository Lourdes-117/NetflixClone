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
    
    @State private var shouldDisplayGenrePicker = false
    @State private var shouldDisplayTopRowPicker = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                
                //Home Top RowButtons
                HomeScreenTopBarView(topBarSelectionBinding: $topBarSelection,
                                     genreBinding: $selectedGenre,
                                     shouldShowTopRowPickerBinding: $shouldDisplayTopRowPicker,
                                     shouldShowGenerPickerBinding: $shouldDisplayGenrePicker)
                
                VStack {
                    
                    ZStack(alignment: .top) {
                        
                        //Movie Preview
                        TopMoviePreview()
                            .frame(width: UIScreen.width)
                            .padding(.top, -100)
                    }
                    
                    //Movie Category List
                    HomeStackView(selectedMovieBinding: $movieDetailsToShow, movies: viewModel.movies, topRowType: topBarSelection)
                }
            }
            
            if let movieToShow = movieDetailsToShow {
                MovieDetailsView(movie: movieToShow, selectedMovieBinding: $movieDetailsToShow)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
            
            if shouldDisplayTopRowPicker {
                Group {
                    Color.black
                        .opacity(0.9)
                        .animation(.easeIn)
                    
                    VStack {
                        Spacer()
                        
                        ForEach(HomeTopRowTypes.allCases, id: \.self) { topRowCase in
                            Button(action: {
                                shouldDisplayTopRowPicker = false
                                topBarSelection = topRowCase
                            }, label: {
                                Text(topRowCase.rawValue)
                                    .foregroundColor(topRowCase == topBarSelection ? .white : .gray)
                                    .font(.system(size: topRowCase == topBarSelection ? 20 : 15))
                                    .padding(.vertical, 5)
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            shouldDisplayTopRowPicker.toggle()
                        }, label: {
                            Image(systemName: "x.circle.fill")
                        })
                        .padding(.bottom, 30)
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .scaleEffect(x: 1.1)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.width, height: UIScreen.height)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
