//
//  CreateEventViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var txtDateEvent: GeneralTextField!
  @IBOutlet weak var txtNameEvent: GeneralTextField!
  @IBOutlet weak var vFormEvent: UIControl!
  @IBOutlet weak var btnSaveEvent: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configView()
    setDelegate()
  }
  
  private func configView() {
    self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
    self.vFormEvent.setBorder(color: #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1), width: 1, radius: 3)
    self.btnSaveEvent.setRadius(radius: 3)
    
    self.txtDateEvent.tintColor = .lightGray
    self.txtDateEvent.textColor = .darkGray
    
    self.txtNameEvent.tintColor = .lightGray
    self.txtNameEvent.textColor = .darkGray
  }
  
  private func setDelegate() {
    self.txtDateEvent.delegate  = self
    self.txtNameEvent.delegate  = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Create Event")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func tapToSaveEvent(_ sender: UIButton) {
    print("save event!")
  }
  
  @IBAction func hideKeyboard(_ sender: UIControl) {
    view.endEditing(true)
  }
  
}

extension CreateEventViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    
    if textField == txtDateEvent {
      let nav = PickCalendarViewController()
      nav.dateListener = { [weak self] date in
        if let date = date {
          self?.txtDateEvent.text = "\(date)"
        }
      }
      navigationController?.pushViewController(nav, animated: true)
      return false
    }
   
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
}
