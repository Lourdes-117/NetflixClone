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
    
    @Binding private var shouldShowTopRowPicker: Bool
    @Binding private var shouldshowShowGenrePicker: Bool
    
    init(topBarSelectionBinding: Binding<HomeTopRowTypes>, genreBinding: Binding<GenreType>, shouldShowTopRowPickerBinding: Binding<Bool>, shouldShowGenerPickerBinding: Binding<Bool>) {
        _topBarSelection = topBarSelectionBinding
        _selectedGenre = genreBinding
        
        _shouldShowTopRowPicker = shouldShowTopRowPickerBinding
        _shouldshowShowGenrePicker = shouldShowGenerPickerBinding
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
            
            
            HStack(spacing: topBarSelection == .home ? 0 : 20) {
                switch topBarSelection {
                case .home:
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
                case .tvShows, .movieList, .myList:
                    Button(action: {
                        //On Select Again
                        shouldShowTopRowPicker = true
                    }, label: {
                        Text(topBarSelection.rawValue)
                            .font(.system(size: 18))
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 10))
                            .rotationEffect(.radians(Double.pi) ,anchor: .center)
                    })
                    
                    Button(action: {
                        //On Select Genre
                        shouldshowShowGenrePicker = true
                    }, label: {
                        Text(GenreType.all.rawValue)
                            .font(.system(size: 13))
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 8))
                            .rotationEffect(.radians(Double.pi) ,anchor: .center)
                    })
                }
            }
            .padding(.trailing, 10)
            
            Spacer()
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
        HomeScreenTopBarView(topBarSelectionBinding: .constant(.home),
                             genreBinding: .constant(.all),
                             shouldShowTopRowPickerBinding: .constant(false),
                             shouldShowGenerPickerBinding: .constant(false))
    }
}
