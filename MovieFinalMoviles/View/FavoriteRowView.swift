//
//  FavoriteRowView.swift
//  MovieFinalMoviles
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct FavoriteRowView: View {
    
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    
    var favorite: Favorite?
    
    var body: some View {
        
        VStack{
            Text(favorite!.title!)
        }
        
    }
}

struct FavoriteRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRowView()
    }
}
