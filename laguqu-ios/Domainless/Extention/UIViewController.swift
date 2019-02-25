//
//  UIViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

enum NavigationBarType {
  case title
  case detailTitle
}

extension UIViewController {
  
  func setNavigationBarType(_ type: NavigationBarType, title: String?) {
    self.navigationItem.title = title
    
    switch type {
    case .title:
      navbarSolidColor()
      titleStyle()
    case .detailTitle:
      backButton()
      navbarSolidColor()
      titleStyle()
    }
  }
  
  private func navbarSolidColor(){
    self.navigationController?.navigationBar.isTranslucent = false
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9176470588, green: 0.1803921569, blue: 0.5764705882, alpha: 1)
    self.navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  private func titleStyle(){
    if let font = UIFont(name: "Poppins-Medium", size: 16.0) {
      let textAttributes = [
        NSAttributedStringKey.foregroundColor:UIColor.white,
        NSAttributedStringKey.font: font
      ]
      
      navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
  }
  
  private func backButton(){
    let imgBack = UIImage(named: "ic_back")
    
    navigationController?.navigationBar.backIndicatorImage = imgBack
    navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
    
    navigationItem.leftItemsSupplementBackButton = true
    
    let barBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.back))
    barBackButton.tintColor = .white
    
    navigationController?.navigationBar.topItem?.backBarButtonItem = barBackButton
  }
  
  @objc func back() {
    if navigationController?.viewControllers.first == self {
      dismiss(animated: true, completion: nil)
    } else {
      navigationController?.popViewController(animated: true)
    }
  }
  
}
