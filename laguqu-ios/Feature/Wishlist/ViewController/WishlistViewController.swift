//
//  WishlistViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class WishlistViewController: UIViewController {
  
  @IBOutlet weak var table: UITableView!
  
  var artistList : [Artist]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerCell()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Wishlist")
   
    do {
      let allArtist = ArtistRealmDao.shared.getAllArtist()
      table.reloadData()
    } catch _ {
      
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func registerCell(){
    table.delegate = self
    table.dataSource = self
    table.emptyDataSetSource = self
    table.emptyDataSetDelegate = self
    table.estimatedRowHeight = ArtisAlbumCell.height
    table.rowHeight = UITableViewAutomaticDimension
    table.register(UINib(nibName: ArtistAlbumWishlistCell.identifier, bundle: nil), forCellReuseIdentifier: ArtistAlbumWishlistCell.identifier)
    table.tableFooterView = UIView()
  }
}


extension WishlistViewController: UITableViewDelegate {
   
}

extension WishlistViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ArtistRealmDao.shared.getAllArtist().count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ArtistAlbumWishlistCell.identifier, for: indexPath) as! ArtistAlbumWishlistCell
    cell.artist = ArtistRealmDao.shared.getAllArtist()[indexPath.row]
    cell.typeMenu = .wishlist
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let artist = ArtistRealmDao.shared.getAllArtist()[indexPath.row]
      ArtistRealmDao.shared.deleteWishList(artist: artist)
      tableView.deleteRows(at: [indexPath], with: .fade)
      tableView.reloadData()
    }
  }
  
}

extension WishlistViewController: DZNEmptyDataSetSource {
  
  func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString(string: "Wishlist tidak tersedia", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
  }
}

extension WishlistViewController: DZNEmptyDataSetDelegate {
  func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
    return ArtistRealmDao.shared.getAllArtist().count == 0
  }
}
