//
//  SplashScreenViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func nextScreen() {
    if User.isLoggin() {
      let nav = HomeTabBarViewController()
      navigationController?.pushViewController(nav, animated: true)
    }else {
      let nav = LoginViewController()
      navigationController?.pushViewController(nav, animated: true)
    }
  }
  
}
