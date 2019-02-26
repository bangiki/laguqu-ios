//
//  User.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 26/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

struct User {
  var id: String?
  var email: String?
  var name: String?
  var accessToken: String?
}

extension User {
  
  static func isLoggin() -> Bool {
    return UserDefaults.standard.string(forKey: "id") != nil
  }

}
