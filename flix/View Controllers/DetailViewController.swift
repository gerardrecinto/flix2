//
//  DetailViewController.swift
//  flix
//
//  Created by Gerard Recinto on 11/24/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

enum MovieKeys{
  static let title = "title"
  static let releaseDate = "release_date"
  static let overview = "overview"
  static let backdropPath = "backdrop_path"
  static let posterPath = "poster_path"
}

@MainActor
class DetailViewController: UIViewController {

  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!

  @IBOutlet weak var overviewLabel: UILabel!
  var movie: [String: Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
      if let movie = movie {
        titleLabel.text = movie[MovieKeys.title] as? String
        releaseDateLabel.text = movie[MovieKeys.releaseDate] as? String
        overviewLabel.text = movie[MovieKeys.overview] as? String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        if let backdropPathString = movie[MovieKeys.backdropPath] as? String,
           let backdropURL = URL(string: baseURLString + backdropPathString) {
            backdropImageView.loadImage(from: backdropURL)
        }
        if let posterPathString = movie[MovieKeys.posterPath] as? String,
           let posterURL = URL(string: baseURLString + posterPathString) {
            posterImageView.loadImage(from: posterURL)
        }
      }
    }
}
