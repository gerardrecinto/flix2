//
//  SuperheroViewController.swift
//  flix
//
//  Created by Gerard Recinto on 11/24/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class SuperheroViewController: UIViewController, UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!
  var movies: [[String: Any]] = []



  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.minimumInteritemSpacing = 5
      layout.minimumLineSpacing = layout.minimumInteritemSpacing
      let cellsPerLine: CGFloat = 3
      let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
      let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
      layout.itemSize = CGSize(width: width, height: width * 3/2)
    }
    fetchMovies()
  }


  func fetchMovies(){
    guard let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1") else { return }
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { [weak self] (data, response, error) in
      guard let self = self else { return }
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        guard let dataDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
        guard let movies = dataDictionary["results"] as? [[String: Any]] else { return }
        self.movies = movies
        self.collectionView.reloadData()
        for movie in movies {
          let title = movie["title"] as? String ?? ""
          print(title)
        }
      }
    }
    task.resume()
  }


  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
    let movie = movies[indexPath.item]
    if let posterPathString = movie[MovieKeys.posterPath] as? String,
       let posterURL = URL(string: "https://image.tmdb.org/t/p/w500" + posterPathString) {
      cell.posterImageView.loadImage(from: posterURL)
    }
    return cell

  }




  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let cell = sender as? UICollectionViewCell,
          let indexPath = collectionView.indexPath(for: cell) else { return }
    let movie = movies[indexPath.item]
    if let detailViewController = segue.destination as? DetailViewController {
      detailViewController.movie = movie
    }
  }

}
