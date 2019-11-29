//
//  FavoriteViewModel.swift
//  MovieFinalMoviles
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI


class FavoriteViewModel: ObservableObject{
    
    @Published var favorites = [Favorite]()
    
    func saveContext(){
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func addFavorite(title: String, id: Int){
        
        let favorite = Favorite(context: context)
        favorite.title = title
        favorite.id = Int32(id)
        favorite.date = Date()
        saveContext()
    }
    
    func getAllFavorites(){
        
        do{
            self.favorites = try context.fetch(Favorite.fetchRequest())
        }catch(let error){
            print(error)
        }
    }
    
    func deleteFavorite(position: Int){
        
        let favorite = favorites[position]
        
        context.delete(favorite)
        saveContext()
    }
    
    init() {
        getAllFavorites()
    }
    
    
}
