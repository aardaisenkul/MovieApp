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
    let imdbRating, imdbID: String
}

