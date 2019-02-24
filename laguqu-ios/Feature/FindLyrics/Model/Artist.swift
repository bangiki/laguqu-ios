//
//  Artist.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import ObjectMapper

struct Artist {
  
  var artistId: Int?
  var artistName: String?
  var artistRating: Int?
  
  init(id: Int, name: String, rating: Int) {
    self.artistId = id
    self.artistName = name
    self.artistRating = rating
  }
}
