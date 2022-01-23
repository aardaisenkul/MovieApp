//
//  MainPageViewModel.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import Foundation

class MainPageViewModel {
    
    var filmData: FetchData?
    var search: [FilmList]?
    var response: String?
    var error: String?
    
    func getDatas(str: String) {
        print("ViewModel Calıstı")
        ApiService.shared.getFilmLists(searchStr: str) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let filmData):
                if let filmData = filmData {
                    
                    DispatchQueue.main.async {
                        self.filmData = filmData
                    }
                }
            }
        }
    }
    
}
