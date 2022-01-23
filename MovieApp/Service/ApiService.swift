//
//  ApiService.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import Foundation


class ApiService {
    
    static let shared = ApiService()
    
    let baseURL = "https://www.omdbapi.com/?apikey=ba64e5cb&s="
    
    let detailBaseUrl = "https://www.omdbapi.com/?apikey=ba64e5cb&i="
    
    func getFilmLists(searchStr: String, completion: @escaping (Result<FetchData?,DownloaderError>) -> Void) {
        
        
        
        let url = URL(string: baseURL + searchStr)
        
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
            }
            
            guard let filmData = try? JSONDecoder().decode(FetchData.self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(filmData))
        }.resume()
        
    }
    
    func getFilmDetails(searchId: String, completion: @escaping (Result<FilmDetail?,DownloaderError>) -> Void) {
        
        
        let url = URL(string: detailBaseUrl + searchId)
        
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let filmDetail = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(filmDetail))
        }.resume()
        
    }
    
}


enum DownloaderError: Error {
    case badUrl
    case noData
    case dataParseError
}
