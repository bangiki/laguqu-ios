//
//  LogoutViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {
  
  @IBOutlet weak var btnLogout: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Logout")
  }
  
  @IBAction func tapToLogout(_ sender: UIButton) {
    
  }
}
