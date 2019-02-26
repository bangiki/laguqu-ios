//
//  UIAlertViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 26/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

extension UIAlertController {
  static func show(title: String? = nil, message: String, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (_) in
      completion?()
    }))
    
    alert.present(animated: true, completion: nil)
  }
  
  func present(animated: Bool, completion: (() -> Void)?) {
    if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
      if rootVC.presentedViewController == nil {
        rootVC.present(self, animated: true, completion: completion)
      } else {
        rootVC.presentedViewController?.present(self, animated: true, completion: nil)
      }
    }
  }
}
