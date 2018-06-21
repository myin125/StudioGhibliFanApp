//
//  FilmTableViewCell.swift
//  GhibliFanApp
//
//  Created by Maryann Yin on 6/19/18.
//  Copyright © 2018 Maryann Yin. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
