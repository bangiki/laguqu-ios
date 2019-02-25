//
//  Artist.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import ObjectMapper

struct Artist : Mappable {
  
  var artistId: Int?
  var artistName: String?
  var artistRating: Int?
  
  init?(map: Map) {
    mapping(map: map)
  }
  
  mutating func mapping(map: Map) {
    artistId <- map["artist.artist_id"]
    artistName <- map["artist.artist_name"]
    artistRating <- map["artist.artist_rating"]
  }
  
}
