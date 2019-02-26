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
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblEmail: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnLogout.setRadius(radius: 3)
    
    guard let nama = UserDefaults.standard.string(forKey: "name"),
      let email = UserDefaults.standard.string(forKey: "email") else {
        return
    }
    lblName.text = nama
    lblEmail.text = email
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Logout")
  }
  
  @IBAction func tapToLogout(_ sender: UIButton) {
    showAlert()
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "Peringatan!", message: "Apakah anda yakin untuk keluar akun?",         preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(UIAlertAction(title: "Batal", style: UIAlertActionStyle.default, handler: { _ in
      //Cancel Action
    }))
    alert.addAction(UIAlertAction(title: "Keluar",
                                  style: UIAlertActionStyle.default,
                                  handler: {(_: UIAlertAction!) in
                                    UserDefaults.standard.removeObject(forKey: "id")
                                    let splash = SplashScreenViewController()
                                    UIApplication.shared.delegate?.window??.rootViewController = UINavigationController(rootViewController: splash)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}
