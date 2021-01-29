//
//  SearchScreen.swift
//  Netflix
//
//  Created by Lourdes on 1/30/21.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchKey: String = ""
    @State private var isEditting: Bool = true
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                SearchBarView(searchKey: $searchKey,
                          isEditting: $isEditting,
                          isLoading: $isLoading)
                    .padding(.top, 10)
                    .animation(.easeInOut(duration: 0.25))
                Spacer()
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
