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
  @IBOutlet weak var btnAddWishlist: UIButton!
  
  static let identifier = "ArtisAlbumCell"
  static let height : CGFloat = 85

  var listener     : ((Artist) -> Void)?
  
  var item: Artist? {
    didSet {
      updateContent()
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    btnAddWishlist.setRadius(radius: 3)
  }
  
  private func updateContent(){
    
    self.nameArtist.text = item?.artistName
    guard let rating = item?.artistRating else {
      return
    }
    self.rating.text = "Rating: \(rating)"
    
  }

  @IBAction func addToWishList(_ sender: UIButton) {
    listener?(item!)
  }
  
}
