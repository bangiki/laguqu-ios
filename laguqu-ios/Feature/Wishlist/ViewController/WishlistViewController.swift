//
//  WishlistViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {
  
  @IBOutlet weak var table: UITableView!
  
  var artistList : [Artist]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    populateData()
    registerCell()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Wishlist")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func populateData(){
    artistList = [Artist(id: 1, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 2, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 3, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 4, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 5, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 6, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 1, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 2, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 3, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 4, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 5, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 6, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 1, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 2, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 3, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 4, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 5, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 6, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 1, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 2, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 3, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 4, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 5, name: "Secondhand Serenade", rating: 10),
                  Artist(id: 6, name: "Secondhand Serenade", rating: 10)]
  }
  
  private func registerCell(){
    table.delegate = self
    table.dataSource = self
    table.estimatedRowHeight = ArtisAlbumCell.height
    table.rowHeight = UITableViewAutomaticDimension
    table.register(UINib(nibName: ArtisAlbumCell.identifier, bundle: nil), forCellReuseIdentifier: ArtisAlbumCell.identifier)
    table.tableFooterView = UIView()
  }
}


extension WishlistViewController: UITableViewDelegate {
  
}

extension WishlistViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let count = self.artistList?.count {
      return count
    }
    
    return 0
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ArtisAlbumCell.identifier, for: indexPath) as! ArtisAlbumCell
    cell.item = self.artistList![indexPath.row]
    return cell
  }
  
}
