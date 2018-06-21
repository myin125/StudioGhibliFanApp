//
//  FilmDetailViewController.swift
//  GhibliFanApp
//
//  Created by Maryann Yin on 6/20/18.
//  Copyright © 2018 Maryann Yin. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var rtScoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: GhibliFilm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImageView.image = UIImage(named: movie!.id)
        titleLabel.text = movie!.title
        dateLabel.text = "Release Date: " + movie!.release_date
        directorLabel.text = "Director: " + movie!.director
        rtScoreLabel.text = "Rotten Tomatoes Score: " + movie!.rt_score
        descriptionLabel.text = "Summary: " + movie!.description
    }

}
