//
//  MovieCell.swift
//  flix
//
//  Created by Gerard Recinto on 11/17/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var overviewLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
