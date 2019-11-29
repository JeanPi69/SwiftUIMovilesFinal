//
//  FavoriteView.swift
//  MovieFinalMoviles
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(self.favoriteVM.favorites,id: \.id){ favorite in
                    FavoriteRowView(favorite: favorite)
                    
                }.onDelete(){
                    indexSet in
                    self.favoriteVM.deleteFavorite(position: indexSet.first!)
                }
            }.navigationBarTitle("Lista de Favoritos")
        }
        
    }
    
    
//    func removeFavorite(at offsets: IndexSet){
//        for index in offsets{
//            favoriteVM.deleteFavorite(position: index)
//        }
//    }
    
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
