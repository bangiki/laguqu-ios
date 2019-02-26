//
//  ArtistRealmDao.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 26/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import RealmSwift

class ArtistRealmDao {
  
  private var database: Realm
  static let shared = ArtistRealmDao()
  
  private init() {
    database = try! Realm()
  }
  
  func addWishList(artist: ArtistRealm) {
    try! database.write {
      database.add(artist)
    }
  }
  
  func getAllArtist() -> Results<ArtistRealm> {
    let results: Results<ArtistRealm> = database.objects(ArtistRealm.self)
    return results
  }
  
  func deleteWishList(artist: ArtistRealm) {
    try! database.write {
      database.delete(artist)
    }
  }
  
}
