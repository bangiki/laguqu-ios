//
//  ApiClient.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 25/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

class ApiClient {
  
  static let API_KEY = "4f7549e47cbd524ddda8f7ca760b4277"
  static let API_KEY_IDENTIFIER = "apikey"
  
  static let apiConfig = SWGConfiguration.sharedConfig()

  static func configApiKey(){
    apiConfig?.setApiKey(API_KEY, forApiKeyIdentifier: API_KEY_IDENTIFIER)
  }
  
}
