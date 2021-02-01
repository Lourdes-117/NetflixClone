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
                        Text("Popular Movies")
                    } else {
                        Text("Search Results")
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
