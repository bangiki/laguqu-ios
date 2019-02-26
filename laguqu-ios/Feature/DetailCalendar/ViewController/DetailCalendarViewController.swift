//
//  DetailCalendarViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class DetailCalendarViewController: UIViewController {
  
  @IBOutlet weak var table: UITableView!
  
  var artistList : [Artist]?
  
  @IBOutlet weak var lblDateEvent: UILabel!
  var date : String
  
  init(date: String) {
    self.date = date
    super.init(nibName: "DetailCalendarViewController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.date = ""
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerCell()
    
    do {
      let events = EventDao.shared.getEventByDate(date: date)
      print("eventtttt :\(events)")
    } catch _ {
      
    }
    
    lblDateEvent.text = date
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.detailTitle, title: "Detail Calendar")
  }

  
  private func registerCell(){
    table.delegate = self
    table.dataSource = self
    table.emptyDataSetSource = self
    table.emptyDataSetDelegate = self
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
    
    return EventDao.shared.getEventByDate(date: date).count
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: EventCalendarCell.identifier, for: indexPath) as! EventCalendarCell
    cell.item = EventDao.shared.getEventByDate(date: date)[indexPath.row]
    return cell
  }
  
}

extension DetailCalendarViewController: DZNEmptyDataSetSource {
  
  func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString(string: "Event tidak tersedia", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
  }
}

extension DetailCalendarViewController: DZNEmptyDataSetDelegate {
  func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
    return EventDao.shared.getEventByDate(date: date).count == 0
  }
}
