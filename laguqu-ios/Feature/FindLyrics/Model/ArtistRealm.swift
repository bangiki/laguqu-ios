//
//  ArtistRealm.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 26/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import RealmSwift

final class ArtistRealmList: Object {
  @objc dynamic var artistId = 0
  @objc dynamic var artistName = ""
  @objc dynamic var ratings = 0
  @objc dynamic var id = ""
  let items = List<ArtistRealm>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

final class ArtistRealm: Object {
  @objc dynamic var artistId = 0
  @objc dynamic var artistName = ""
  @objc dynamic var ratings = 0
}
