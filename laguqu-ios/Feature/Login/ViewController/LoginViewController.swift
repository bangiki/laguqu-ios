//
//  LoginViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if #available(iOS 11.0, *) {
      self.scrollView.contentInsetAdjustmentBehavior = .never
    } else {
      automaticallyAdjustsScrollViewInsets = false
    }
    
    UIApplication.shared.statusBarStyle = .lightContent
    setNeedsStatusBarAppearanceUpdate()
  }
  
  @IBAction func tapToLoginWithFacebook(_ sender: UIButton) {
    let home = HomeTabBarViewController()
    navigationController?.pushViewController(home, animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
