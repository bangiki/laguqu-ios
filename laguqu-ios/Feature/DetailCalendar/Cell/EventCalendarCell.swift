//
//  EventCalendarCell.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class EventCalendarCell: UITableViewCell {
  
  static let identifier = "EventCalendarCell"
  static let height : CGFloat = 77
  
  @IBOutlet weak var eventName: UILabel!
  
  var item: Event? {
    didSet {
      updateContent()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  private func updateContent(){
    self.eventName.text = item?.nameEvent
  }
  
  
}
