//
//  FacebookLogin.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 25/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FBSDKCoreKit

class FacebookLogin {
  static let shared = FacebookLogin()
  
  let loginManager = FBSDKLoginManager()

  func login(from: UIViewController) {

    loginManager.logIn(withReadPermissions: ["public_profile", "email"], from: from) { [weak self] (result, error) in
     
      guard let res = result else { return }
      
      if res.isCancelled {
        UIAlertController.show(message: "Facebook login canceled")
      } else {
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id,name,email"]).start(completionHandler: { [weak self] (connection, result, error) in
         
          if let er = error {
            UIAlertController.show(message: er.localizedDescription)
          } else {
            if let res = result as? Dictionary<String, String> {
             
              guard let id = res["id"],
                let name = res["name"],
                let email = res["email"] else {
                  return
              }
              UserDefaults.standard.set(id, forKey: "id")
              UserDefaults.standard.set(name, forKey: "name")
              UserDefaults.standard.set(email, forKey: "email")
            } else {
            }
          }
        })
      }
    }
  }
}
