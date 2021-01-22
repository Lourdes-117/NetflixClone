//
//  HomeScreenTopBarView.swift
//  Netflix
//
//  Created by Lourdes on 12/16/20.
//

import SwiftUI

struct HomeScreenTopBarView: View {
    let viewModel = HomeScreenTopBarViewModel()
    
    @Binding private var topBarSelection: HomeTopRowTypes
    @Binding private var selectedGenre: GenreType
    
    init(topBarSelectionBinding: Binding<HomeTopRowTypes>, genreBinding: Binding<GenreType>) {
        _topBarSelection = topBarSelectionBinding
        _selectedGenre = genreBinding
    }
    
    var body: some View {
        HStack {
            
            Button(action: {
                //OnClick Netflix Logo Button
                topBarSelection = .home
            }, label: {
                Image(viewModel.logoImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            
            Spacer()
            
            Button(action: {
                //OnClick Tv Shows Button
                topBarSelection = .tvShows
            }, label: {
                Text("TV Shows")
            })
            
            Spacer()
            
            Button(action: {
                //OnClick Movies Button
                topBarSelection = .movieList
            }, label: {
                Text("Movies")
            })
            
            Spacer()
            
            Button(action: {
                //OnClick My List Button]
                topBarSelection = .myList
            }, label: {
                Text("My List")
            })
            .padding(.trailing, 10)
        }
        .background(Color.black.opacity(0.3))
        .foregroundColor(.white)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .zIndex(1)
    }
}

struct HomeScreenTopBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenTopBarView(topBarSelectionBinding: .constant(.home), genreBinding: .constant(.all))
    }
}
