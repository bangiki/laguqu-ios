//
//  ArtistAlbumWishlistCell.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 26/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class ArtistAlbumWishlistCell: UITableViewCell {
  

  @IBOutlet weak var nameArtist: UILabel!
  @IBOutlet weak var rating: UILabel!
  
  static let identifier = "ArtistAlbumWishlistCell"
  static let height : CGFloat = 85
  
  var typeMenu : TypeMenu?
  
  var listener     : ((Artist) -> Void)?

  var artist: ArtistRealm? {
    didSet {
      updateContentArtist()
    }
  }

  private func updateContentArtist(){
    self.nameArtist.text = artist?.artistName
    
    if let ratings = artist?.ratings {
      self.rating.text = "Rating: \(ratings)"
    }
  }
  
}
