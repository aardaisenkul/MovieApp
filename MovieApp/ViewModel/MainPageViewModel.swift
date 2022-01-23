//
//  MainPageViewModel.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import Foundation
import UIKit

class MainPageViewModel : ObservableObject{
    
    var filmData: FetchData?
    var search: [FilmList]?
    var response: String?
    var error: String?
    var mainController : ViewController?
    
    
    
    func getDatas(str: String ) {
        print("ViewModel Calıstı")
        ApiService.shared.getFilmLists(searchStr: str) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.mainController?.showAlert(err: "There is no such a film")
                }
                
                print(error)
            case .success(let filmData):
                if let filmData = filmData {
                    
                    DispatchQueue.main.async {
                        self.filmData = filmData
                        self.mainController!.tableView.reloadData()
                    }
                    
                }
            }
        }
    }
    
}
