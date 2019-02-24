//
//  UIView.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

extension UIView{
  
  func setBorder(color: UIColor?, width: CGFloat = 0, radius: CGFloat = 0){
    self.layer.borderWidth = width
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
    self.layer.borderColor = color?.cgColor ?? nil
  }
  
  func setRadius(radius: CGFloat = 0){
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
  }
  
}
