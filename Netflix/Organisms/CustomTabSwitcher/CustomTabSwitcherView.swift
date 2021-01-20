//
//  CustomTab.swift
//  Netflix
//
//  Created by Lourdes on 12/24/20.
//

import SwiftUI

struct CustomTabSwitcherView: View {
    @State private var selectedTab: CustomTabStates = .episodes
    let viewModel = CustomTabSwitcherViewModel()
    
    @Binding private var seasonPickerBinder: Bool
    @Binding private var selectedSeason: Int
    
    init(tabs: [CustomTabStates], movie: MovieModel, seasonPickerBinder: Binding<Bool>, selectedSeason: Binding<Int>) {
        viewModel.tabs = tabs
        viewModel.movie = movie
        _seasonPickerBinder = seasonPickerBinder
        _selectedSeason = selectedSeason
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(viewModel.tabs, id: \.self) { tab in
                        VStack {
                            //Red Bar
                            Rectangle()
                                .frame(width: tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold)),height: 6)
                                .animation(.easeInOut)
                                .foregroundColor(tab == selectedTab ? .red : .clear )
                                .cornerRadius(3.0, antialiased: true)
                            
                            //Button
                            Button(action: {
                                selectedTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundColor(tab == selectedTab ? .white : .gray)
                            })
                            .frame(width: tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold)))
                        }
                    }
                }
            }
            
            //Selected View
            switch selectedTab {
            case .episodes:
                EpisodeView(seasonPickerBilder: $seasonPickerBinder, episodes: viewModel.seasons, selectedSeasonNumber: $selectedSeason)
            case .trailers:
                TrailersListView(trailers: viewModel.trailers)
            case .more:
                MoreLikeThisGrid(movies: viewModel.moreLikeThis)
            }
        }
        .foregroundColor(.white)
    }
}

struct CustomTabSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcherView(tabs: [.episodes, .trailers, .more],
                                  movie: exampleMovie1,
                                  seasonPickerBinder: .constant(false),
                                  selectedSeason: .constant(1))
        }
    }
}
