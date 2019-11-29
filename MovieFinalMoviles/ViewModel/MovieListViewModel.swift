//
//  MovieListViewModel.swift
//  MovieFinalMoviles
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI
import Foundation

class MovieListViewModel: ObservableObject{
    
    @Published var movies = [Movie]()
    
    func createURL(query: String) -> URL{
        
        var urlComponent = URLComponents()
        var apiKey = URLQueryItem(name: "api_key", value: "3cae426b920b29ed2fb1c0749f258325")
        var queryItem = URLQueryItem(name: "query", value: query)
        
        urlComponent.scheme = "https"
        urlComponent.host = "api.themoviedb.org"
        urlComponent.path = "/3/search/movie"
        urlComponent.queryItems = [apiKey,queryItem]
        urlComponent.percentEncodedQuery = urlComponent.percentEncodedQuery?.replacingOccurrences(of: "%20", with: "+")
        return urlComponent.url!
    }
    
    func getMovies(query: String = "harry"){
        
        session.dataTask(with: createURL(query: query)){ data, response, error in
            
            DispatchQueue.main.async {
                let movieResponse = try! JSONDecoder().decode(MovieResponse.self, from: data!)
                
                self.movies = movieResponse.movies
            }
            
            
        }.resume()
        
    }
    
    init(){
        getMovies()
    }
    
}
