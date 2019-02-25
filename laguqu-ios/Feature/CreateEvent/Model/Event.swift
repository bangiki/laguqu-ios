//
//  Event.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 25/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import RealmSwift

final class EventList: Object {
  @objc dynamic var dateEvent = ""
  @objc dynamic var nameEvent = ""
  @objc dynamic var id = ""
  let items = List<Event>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

final class Event: Object {
  @objc dynamic var dateEvent = ""
  @objc dynamic var nameEvent = ""
}
