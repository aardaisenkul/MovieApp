//
//  FilmDetail.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import Foundation

// MARK: - Welcome
struct FilmDetail: Codable {
    let title, year: String
    let runtime, genre, director: String
    let actors, country: String
    let poster: String
    let imdbRating, imdbID,response: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        
        case actors = "Actors"
        
        
        case country = "Country"
        
        case poster = "Poster"
        
        
        case imdbRating, imdbID
        case response = "Response"
    }
}

