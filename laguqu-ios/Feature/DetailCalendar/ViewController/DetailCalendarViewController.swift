//
//  DetailCalendarViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class DetailCalendarViewController: UIViewController {
  
  @IBOutlet weak var table: UITableView!
  
  var artistList : [Artist]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    populateData()
    registerCell()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.detailTitle, title: "Detail Calendar")
  }
  
  private func populateData(){
    artistList = [Artist(id: 1, name: "Event Family Gathering 2019", rating: 10),
                  Artist(id: 1, name: "Event Family Gathering 2019, Event Family Gathering 2019, Event Family Gathering 2019, Event Family Gathering 2019,", rating: 10),
                  Artist(id: 1, name: "Event Family Gathering 2019", rating: 10)]
  }
  
  private func registerCell(){
    table.delegate = self
    table.dataSource = self
    table.estimatedRowHeight = ArtisAlbumCell.height
    table.rowHeight = UITableViewAutomaticDimension
    table.register(UINib(nibName: EventCalendarCell.identifier, bundle: nil), forCellReuseIdentifier: EventCalendarCell.identifier)
    table.tableFooterView = UIView()
  }
  
}

extension DetailCalendarViewController: UITableViewDelegate {
  
}

extension DetailCalendarViewController: UITableViewDataSource {
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
    let cell = tableView.dequeueReusableCell(withIdentifier: EventCalendarCell.identifier, for: indexPath) as! EventCalendarCell
    cell.item = self.artistList![indexPath.row]
    return cell
  }
  
}
