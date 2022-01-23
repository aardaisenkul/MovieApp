//
//  DetailPageViewModel.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import Foundation

class DetailPageViewModel {
    
    var filmDetail: FilmDetail?
    
    var mainController : DetailViewController?
    
    func getDetail(str: String) {
        ApiService.shared.getFilmDetails(searchId: str) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let filmDetail):
                if let filmDetail = filmDetail {
                    
                    DispatchQueue.main.async {
                        self.filmDetail = filmDetail
                        self.mainController?.configureUI()
                    }
                }
            }
        }
    }
}

