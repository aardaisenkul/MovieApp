//
//  ViewController.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = MainPageViewModel()
    var selectedImdbId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        viewModel.mainController = self
        viewModel.getDatas(str: "Kong")
        searchBar.searchTextField.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .black
        title = "Movie List"
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = viewModel.filmData?.search.count else { return 0 }
        return rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilmTableViewCell
        
        cell.imageUrl = viewModel.filmData?.search[indexPath.row].poster ?? ""
        cell.prepareImg()
        cell.nameLabel.text = viewModel.filmData?.search[indexPath.row].title
        cell.yearLabel.text = viewModel.filmData?.search[indexPath.row].year
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: viewModel.filmData?.search[indexPath.row].imdbID)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinationVC = segue.destination as! DetailViewController
            
            destinationVC.detailImdbId = sender as? String
        }
    }
    func showAlert(err : String){
        let alert = UIAlertController(title: "Error", message: err, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
}


extension ViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTxt = searchBar.searchTextField.text else{ return}
        viewModel.getDatas(str: searchTxt)
        
        
        
    }
}



