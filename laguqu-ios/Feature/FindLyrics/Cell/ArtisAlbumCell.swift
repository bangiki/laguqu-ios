//
//  ArtisAlbumCell.swift
//  custom-uikit-ios
//
//  Created by Rizki Ramdani on 23/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class ArtisAlbumCell: UITableViewCell {
  
  @IBOutlet weak var nameArtist: UILabel!
  @IBOutlet weak var rating: UILabel!
  
  static let identifier = "ArtisAlbumCell"
  static let height : CGFloat = 85
  
  var item: Artist? {
    didSet {
      updateContent()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  private func updateContent(){
    print("item artist \(item)")
    self.nameArtist.text = item?.artistName
    guard let rating = item?.artistRating else {
      return
    }
    self.rating.text = "Rating: \(rating)"
  }

}
