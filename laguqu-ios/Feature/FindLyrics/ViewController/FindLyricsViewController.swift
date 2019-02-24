//
//  FindLyricsViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class FindLyricsViewController: UIViewController {
  
  @IBOutlet weak var table: UITableView!
  
  let searchController = UISearchController(searchResultsController: nil)
  
  var artistList : [Artist]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    populateData()
    registerCell()
    setupSearchBar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Find")
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
  
  private func setupSearchBar() {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Artist"
    //navigationItem.searchController = searchController
    definesPresentationContext = true
    searchController.searchBar.delegate = self
    searchController.searchBar.backgroundImage = UIImage()
    searchController.searchBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    searchController.searchBar.sizeToFit()
    table.tableHeaderView = searchController.searchBar
    if #available(iOS 11.0, *) {
      //navigationItem.searchController = searchController
      //navigationItem.hidesSearchBarWhenScrolling = true
    } else {
      table.tableHeaderView = searchController.searchBar
    }
  }
  
}

extension FindLyricsViewController: UITableViewDelegate {
  
}

extension FindLyricsViewController: UITableViewDataSource {
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


extension FindLyricsViewController: UISearchBarDelegate {
  
  // MARK: - UISearchBar Delegate
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if let artistName = searchBar.text {
      print("keyword :\(artistName)")
    }
  }
}

extension FindLyricsViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
  }
}
