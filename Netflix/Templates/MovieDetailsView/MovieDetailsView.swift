//
//  MovieDetailsView.swift
//  Netflix
//
//  Created by Lourdes on 12/19/20.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel = MovieDetailsViewModel()
    
    @State private var shouldShowSeasonPicker: Bool = false
    @State private var selectedSeason: Int = 1
    @State private var isLiked: Bool = false
    
    init(movie: MovieModel) {
        viewModel = MovieDetailsViewModel(movie: movie)
    }
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            //Close Button Tap Action
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .background(Color.clear)
                    .padding(.horizontal, 22)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            //Image
                            StandardHomeMovie(movie: viewModel.movie)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.width/2.5)
                            
                            //Info SubHeadline
                            MovieInfoSubHeadline(details: viewModel.details, isLiked: $isLiked)
                            if let promotionalHeadline = viewModel.promotionHeadline {
                                Text(promotionalHeadline)
                                    .bold()
                                    .font(.title3)
                                    .padding(.top, 10)
                            }
                            
                            //PlayButton
                            HorizontalButtonView(backgroundColor: .red, foregroundColor: .white, text: "Play", image: "play.fill") {
                                //Play Button Click Action
                            }
                            .padding(.all, 10)
                            .cornerRadius(5.0)
                            
                            //Episode Title
                            if let episodeTitle = viewModel.episodeInformationTitle {
                                Text(episodeTitle)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .padding(.bottom, 5.0)
                                    .padding(.horizontal, 8.0)
                                    .frame(width: UIScreen.width, alignment: .leading)
                            }
                            
                            //Episode Description
                            Text(viewModel.episodeDescription)
                                .font(.subheadline)
                                .padding(.horizontal, 8.0)
                                .padding(.bottom, 4)
                            
                            //Cast
                            if let cast = viewModel.cast {
                                Text(cast)
                                    .padding(.horizontal, 8.0)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .frame(width: UIScreen.width, alignment: .leading)
                            }
                            
                            //Creators
                            if let creators = viewModel.creators {
                                Text(creators)
                                    .padding(.horizontal, 8.0)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .frame(width: UIScreen.width, alignment: .leading)
                            }
                            
                            //List, Like, Share button
                            
                            HStack(spacing: 60) {
                                VerticalButtonView(label:"My List", onStateImage: "checkmark", offStateImage: "plus") {
                                    //MyLick Button Tapped
                                }
                                
                                VerticalButtonView(label:"Like", onStateImage: "hand.thumbsup.fill", offStateImage: "hand.thumbsup", isOnBinding: $isLiked) {
                                    //Like button tap
                                }
                                                            
                                VerticalButtonView(label:"Share", onStateImage: "square.and.arrow.up", offStateImage: "square.and.arrow.up") {
                                    //Share button tap
                                }
                                Spacer()
                            }
                            .padding([.leading, .bottom], 20)
                            .padding(.top, 10)
                            
                            //Tab Switcher
                            CustomTabSwitcherView(tabs: [.episodes, .trailers, .more],
                                                  movie: exampleMovie1,
                                                  seasonPickerBinder: $shouldShowSeasonPicker,
                                                  selectedSeason: $selectedSeason)
                                .frame(width: UIScreen.width)

                        }
                    }
                }
                if shouldShowSeasonPicker {
                    Group {
                        Color.black.opacity(0.9)
                        VStack {
                            Spacer()
                            
                            ForEach(1..<viewModel.numberOfSeasons + 1) { seasonNumber in
                                Button(action: {
                                    selectedSeason = seasonNumber
                                    shouldShowSeasonPicker.toggle()
                                }, label: {
                                    Text("Season \(seasonNumber)")
                                })
                                .padding(.vertical, 5)
                                .foregroundColor( selectedSeason == seasonNumber ? .white : .gray)
                                .font(.system(size: selectedSeason == seasonNumber ? 20 : 15))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                shouldShowSeasonPicker.toggle()
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
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: exampleMovie1)
    }
}
