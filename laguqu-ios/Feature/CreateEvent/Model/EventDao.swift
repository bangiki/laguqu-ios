//
//  EventDao.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 25/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import RealmSwift

enum RuntimeError: Error {
  case NoRealmSet
}

class EventDao {
  
  private var database: Realm
  static let shared = EventDao()
  
  private init() {
    database = try! Realm()
  }
  
  func addEvent(event: Event) {
    try! database.write {
      database.add(event)
    }
  }
  
  func getAllEvent() -> Results<Event> {
    let results: Results<Event> = database.objects(Event.self)
    return results
  }
  
  func getEventByDate(date: String) -> Results<Event> {
    let results: Results<Event> = database.objects(Event.self)
    return results.filter("dateEvent == %@", date)
  }
  
}
