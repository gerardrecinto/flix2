//
//  Movie.swift
//  flix
//
//  Created by Gerard Recinto on 12/30/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import Foundation

class Movie {
  var title: String
  var posterUrl: URL?
  
  init(dictionary: [String: Any]) {
    title = dictionary["title"] as? String ?? "No title"
    
    // Set the rest of the properties
}
}
