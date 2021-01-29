//
//  TabBarView.swift
//  Netflix
//
//  Created by Lourdes on 1/30/21.
//

import SwiftUI

struct TabBarView: View {
    var viewModel = TabBarViewModel()
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            SearchScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            
            Text("Coming Soon")
                .tabItem {
                    VStack {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }
                }
            
            Text("Dowloads")
                .tabItem {
                    VStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("Dowloads")
                    }
                }
            
            Text("Menu")
                .tabItem {
                    VStack {
                        Image(systemName: "equal")
                        Text("Menu")
                    }
                }
        }
        .accentColor(.white)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
