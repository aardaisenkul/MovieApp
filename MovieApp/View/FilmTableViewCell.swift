//
//  FilmTableViewCell.swift
//  MovieApp
//
//  Created by Ali Arda İsenkul on 23.01.2022.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    var imageUrl : String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func prepareImg(){
        
        let url = URL(string: imageUrl)
        guard let url = url else{return}
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.filmImage.image = UIImage(data: data!)
            }
        }
    }
    
}
