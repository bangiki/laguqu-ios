//
//  HomeTabBarViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
  
  private lazy var findLyricsView: UINavigationController = {
    let findLyrics = FindLyricsViewController()
    let findLyricsNav = AHKNavigationController(rootViewController: findLyrics)
    return findLyricsNav
  }()
  
  private lazy var calendarView: UINavigationController = {
    let calendarView = CalendarViewController()
    let calendarNav = AHKNavigationController(rootViewController: calendarView)
    return calendarNav
  }()
  
  private lazy var wishListView: UINavigationController = {
    let wishList = WishlistViewController()
    let wishListNav = AHKNavigationController(rootViewController: wishList)
    return wishListNav
  }()
  
  private lazy var createEventView: UINavigationController = {
    let createEvent = CreateEventViewController()
    let createEventNav = AHKNavigationController(rootViewController: createEvent)
    return createEventNav
  }()
  
  private lazy var logoutView: UINavigationController = {
    let logout = LogoutViewController()
    let logoutNav = AHKNavigationController(rootViewController: logout)
    return logoutNav
  }()
  
  init(){
    super.init(nibName: nil, bundle: nil)
    commonInitial()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func commonInitial(){
    viewControllers = [findLyricsView,
                       calendarView,
                       wishListView,
                       createEventView,
                       logoutView]
    
    let images = [UIImage(named: "icon_find_unselected"),
                  UIImage(named: "icon_calendar_unselected"),
                  UIImage(named: "icon_wishlist_unselected"),
                  UIImage(named: "icon_create_event_unselected"),
                  UIImage(named: "icon_logout_unselected")]
    
    let imagesSelected = [UIImage(named: "icon_find_unselected")?.withRenderingMode(.alwaysTemplate),
                          UIImage(named: "icon_calendar_unselected")?.withRenderingMode(.alwaysTemplate),
                          UIImage(named: "icon_wishlist_unselected")?.withRenderingMode(.alwaysTemplate),
                          UIImage(named: "icon_create_event_unselected")?.withRenderingMode(.alwaysTemplate),
                          UIImage(named: "icon_logout_unselected")?.withRenderingMode(.alwaysTemplate),]
    
    if let items = tabBar.items {
      
      for item in items {
        item.image = images[items.index(of: item)!]
        item.selectedImage = imagesSelected[items.index(of: item)!]
        item.title = ""
        item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
      }
    }
    
    tabBar.tintColor = #colorLiteral(red: 0.9176470588, green: 0.1803921569, blue: 0.5764705882, alpha: 1)
    tabBar.unselectedItemTintColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    tabBar.backgroundColor = UIColor.white
  }
}
