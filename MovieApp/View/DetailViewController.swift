//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var detailViewModel = DetailPageViewModel()
    var detailedFilm : FilmDetail?
    
    var detailImdbId : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.getDetail(str: detailImdbId)
        guard let detailedFilm = detailViewModel.filmDetail else {return}
        self.detailedFilm = detailedFilm
      
      
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureUI()

    }

    
    func configureUI(){
        prepareImg()
        nameLabel.text = detailViewModel.filmDetail?.title
        dateLabel.text = detailViewModel.filmDetail?.year
        actorLabel.text = detailViewModel.filmDetail?.actors
        countryLabel.text = detailViewModel.filmDetail?.country
        directorLabel.text = detailViewModel.filmDetail?.director
        ratingLabel.text = detailViewModel.filmDetail?.imdbRating
    }
    
    func prepareImg(){
        guard let imageUrl = detailViewModel.filmDetail?.poster else {return}
        let url = URL(string: imageUrl)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    


}

