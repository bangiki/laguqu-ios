//
//  MessageResponse.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 25/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import ObjectMapper

struct MessageResponse : Mappable{
  
  var artistList: [Artist]?
  
  init?(map: Map) {
    mapping(map: map)
  }
  
  mutating func mapping(map: Map) {
    artistList <- map["message.body.artist_list"]
  }
  
}
