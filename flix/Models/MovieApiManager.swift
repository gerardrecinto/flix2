//
//  MovieApiManager.swift
//  flix
//
//  Created by Gerard Recinto on 12/30/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import Foundation
class MovieApiManager {

  static let baseUrl = "https://api.themoviedb.org/3/movie/"
  static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
  var session: URLSession

  init() {
    session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
  }

  func nowPlayingMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
    guard let url = URL(string: MovieApiManager.baseUrl + "now_playing?api_key=\(MovieApiManager.apiKey)") else {
      completion(nil, nil)
      return
    }
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let task = session.dataTask(with: request) { [weak self] (data, response, error) in
      guard self != nil else { return }
      if let data = data {
        guard let dataDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
        guard let movieDictionaries = dataDictionary["results"] as? [[String: Any]] else { return }
        _ = movieDictionaries
        //let movies = Movie.movies(dictionaries: movieDictionaries)
        //completion(movies, nil)
      } else {
        completion(nil, error)
      }
    }
    task.resume()
  }
}
