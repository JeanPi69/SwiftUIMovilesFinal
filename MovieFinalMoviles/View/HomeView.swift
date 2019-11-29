//
//  HomeView.swift
//  MovieFinalMoviles
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            
            SearchView().tabItem(){
                Image(systemName: "magnifyingglass")
                Text("Movies")
            }
            
            FavoriteView().tabItem(){
                Image(systemName: "star")
                Text("Favorites")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
