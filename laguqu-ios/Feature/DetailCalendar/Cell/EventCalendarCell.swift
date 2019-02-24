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
  static let height : CGFloat = 85
  
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var eventName: UILabel!
  @IBOutlet weak var eventDate: UILabel!
  
  var item: Artist? {
    didSet {
      updateContent()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  private func updateContent(){
    self.icon.image = UIImage(named: "icon_event")
    self.eventName.text = item?.artistName
    guard let rating = item?.artistRating else {
      return
    }
    self.eventDate.text = "date: \(rating)"
  }
  
  
}
