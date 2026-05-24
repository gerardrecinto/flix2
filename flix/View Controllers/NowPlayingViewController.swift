//
//  NowPlayingViewController.swift
//  flix
//
//  Created by Gerard Recinto on 11/17/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var refreshControl: UIRefreshControl!

  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  var movies: [[String: Any]] = []
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 120
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
    tableView.insertSubview(refreshControl, at: 0)
    activityIndicator.startAnimating()
    fetchMovies()
    activityIndicator.stopAnimating()

  }

  @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
    activityIndicator.startAnimating()
    fetchMovies()
    activityIndicator.stopAnimating()
  }

  func fetchMovies(){
    guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed") else { return }
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { [weak self] (data, response, error) in
      guard let self = self else { return }
      // This will run when the network request returns
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        self.activityIndicator.startAnimating()
        guard let dataDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }

        guard let movies = dataDictionary["results"] as? [[String: Any]] else { return }
        self.movies = movies
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        for movie in movies {
          let title = movie["title"] as? String ?? ""
          print(title)
        }
        self.activityIndicator.stopAnimating()
      }
    }
    task.resume()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
    let movie = movies[indexPath.row]
    let title = movie["title"] as? String ?? ""
    let overview = movie["overview"] as? String ?? ""
    cell.titleLabel.text = title
    cell.overviewLabel.text = overview

    if let posterPathString = movie["poster_path"] as? String,
       let posterURL = URL(string: "https://image.tmdb.org/t/p/w500" + posterPathString) {
      cell.posterImageView.loadImage(from: posterURL)
    }
    return cell
  }



  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let cell = sender as? UITableViewCell,
          let indexPath = tableView.indexPath(for: cell) else { return }
    let movie = movies[indexPath.row]
    if let detailViewController = segue.destination as? DetailViewController {
      detailViewController.movie = movie
    }
  }


}
