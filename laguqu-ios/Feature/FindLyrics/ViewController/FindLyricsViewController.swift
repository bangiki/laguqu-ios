//
//  FindLyricsViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit
import SVProgressHUD
import ObjectMapper
import DZNEmptyDataSet

enum TypeMenu {
  case find
  case wishlist
}

class FindLyricsViewController: UIViewController {
  
  @IBOutlet weak var table: UITableView!
  
  let searchController = UISearchController(searchResultsController: nil)
  
  var artistList : [Artist]?
 
  let swgArtistSearch = SWGArtistApi()
  let format = "json"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ApiClient.configApiKey()
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
  
  private func searchArtist(name: String){
    SVProgressHUD.show()
    
    swgArtistSearch.artistSearchGet(withFormat: format,
                                    callback: nil,
                                    qArtist: name.lowercased(),
                                    fArtistId: nil,
                                    page: nil,
                                    pageSize: 25,
                                    completionHandler: ({ [weak self] (response, error) in
                                      
                                      guard let jsonString = response?.toJSONString() else { return }
                                      let artistList = Mapper<MessageResponse>().map(JSONString: jsonString)?.artistList
                                      
                                      let artisRealm = ArtistRealmDao.shared.getAllArtist()
                                      
                                      //let compare = artistList?.filter()
                                      
                                      self?.artistList = artistList
                                      self?.table.reloadData()
                                      SVProgressHUD.dismiss()
                                    }))
    
  }
  
  private func registerCell(){
    table.delegate = self
    table.dataSource = self
    table.emptyDataSetSource = self
    table.emptyDataSetDelegate = self
    table.estimatedRowHeight = ArtisAlbumCell.height
    table.rowHeight = UITableViewAutomaticDimension
    table.register(UINib(nibName: ArtisAlbumCell.identifier, bundle: nil), forCellReuseIdentifier: ArtisAlbumCell.identifier)
    table.tableFooterView = UIView()
  }
  
  private func setupSearchBar() {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Artist"
    definesPresentationContext = true
    searchController.searchBar.delegate = self
    searchController.searchBar.backgroundImage = UIImage()
    searchController.searchBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    searchController.searchBar.sizeToFit()
    table.tableHeaderView = searchController.searchBar
    table.tableHeaderView = searchController.searchBar
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "Berhasil!", message: "Artist berhasil dimasukan kedalam wishlist", preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { _ in
      
    }))
    self.present(alert, animated: true, completion: nil)
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
    cell.listener = { [weak self] value in
      
      guard let artistId = value.artistId,
        let artistName = value.artistName,
        let ratings = value.artistRating  else {
          return
      }
      
      let myFavArtist = ArtistRealm(value: ["artistId": artistId,
                                            "artistName": artistName,
                                            "ratings": ratings])
      
      do {
        ArtistRealmDao.shared.addWishList(artist: myFavArtist)
        self?.showAlert()
      } catch _ {
        fatalError()
      }
      
    }
    
    return cell
  }
  
}


extension FindLyricsViewController: UISearchBarDelegate {
  
  // MARK: - UISearchBar Delegate
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if let artistName = searchBar.text {
      searchArtist(name: artistName)
    }
  }
}

extension FindLyricsViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
  }
}


extension FindLyricsViewController: DZNEmptyDataSetSource {
  
  func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString(string: "Hasil pencarian tidak ada.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
  }
}

extension FindLyricsViewController: DZNEmptyDataSetDelegate {
  func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
    return self.artistList == nil
  }
}
