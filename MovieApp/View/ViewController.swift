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
    var films : [FilmList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

        viewModel.getDatas(str: "Batman")
    }
    override func viewDidAppear(_ animated: Bool) {
        guard let films = viewModel.filmData?.search else { return }
        self.films = films
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = viewModel.filmData?.search.count else { return 0 }
        return rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilmTableViewCell

        cell.imageUrl = films[indexPath.row].poster
        cell.prepareImg()
        cell.nameLabel.text = films[indexPath.row].title
        cell.yearLabel.text = films[indexPath.row].year
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}



