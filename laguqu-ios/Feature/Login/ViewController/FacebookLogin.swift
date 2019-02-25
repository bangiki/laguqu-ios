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
        //self.UIAlertController.show(message: "Facebook Login cancelled")
      } else {
        if res.grantedPermissions.contains("email") {
         
          FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id,name,email"]).start(completionHandler: { [weak self] (connection, result, error) in
            
            
            //self?.isLoading.value = false
            
            if let er = error {
              //UIAlertController.show(message: "Facebook Login cancelled")
              //self?.error.value = ApiError.middlewareError(code: 0, message: er.localizedDescription)
            } else {
              if let res = result as? Dictionary<String, String> {

                print("response facebook login :\(res)")
                
                if let token = FBSDKAccessToken.current().tokenString {
                  UserDefaults.standard.set(token, forKey: "token")
                  //Persistent.shared.set(key: .sessionID, value: token)
                }
                //self?.results.value = res
              } else {
                //self?.error.value = ApiError.middlewareError(code: 0, message: "Failed. Please try again.")
              }
            }
          })
        } else {
          //self?.error.value = ApiError.middlewareError(code: 0, message: "Cannot access your email address")
        }
      }
    }
  }
}
