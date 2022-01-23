//
//  FilmList.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import Foundation

// MARK: - FetchData
struct FetchData: Codable {
    let search: [FilmList]
    let totalResults, response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - FilmList
struct FilmList: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
