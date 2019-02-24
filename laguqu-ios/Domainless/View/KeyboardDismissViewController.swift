//
//  KeyboardDismissViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

class KeyboardDismissViewController: UIViewController {

  
  @IBAction func hideKeyboard(_ sender: UIControl) {
    view.endEditing(true)
  }
  
}
