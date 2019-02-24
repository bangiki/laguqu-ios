//
//  CalendarViewController.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 24/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import UIKit


class CalendarViewController: UIViewController {
  
  @IBOutlet weak var monthHeaderView: VAMonthHeaderView! {
    didSet {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "LLLL"
      
      let appereance = VAMonthHeaderViewAppearance(
        previousButtonImage: #imageLiteral(resourceName: "previous"),
        nextButtonImage: #imageLiteral(resourceName: "next"),
        dateFormatter: dateFormatter
      )
      monthHeaderView.delegate = self
      monthHeaderView.appearance = appereance
    }
  }
  
  @IBOutlet weak var weekDaysView: VAWeekDaysView! {
    didSet {
      let appereance = VAWeekDaysViewAppearance(symbolsType: .veryShort, calendar: defaultCalendar)
      weekDaysView.appearance = appereance
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBarType(.title, title: "Calendar")
  }
  
  let defaultCalendar: Calendar = {
    var calendar = Calendar.current
    calendar.firstWeekday = 1
    calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    return calendar
  }()
  
  var calendarView: VACalendarView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let calendar = VACalendar(calendar: defaultCalendar)
    calendarView = VACalendarView(frame: .zero, calendar: calendar)
    calendarView.showDaysOut = true
    calendarView.selectionStyle = .single
    calendarView.monthDelegate = monthHeaderView
    calendarView.dayViewAppearanceDelegate = self
    calendarView.monthViewAppearanceDelegate = self
    calendarView.calendarDelegate = self
    calendarView.scrollDirection = .horizontal
    calendarView.setSupplementaries([])
    view.addSubview(calendarView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    if calendarView.frame == .zero {
      calendarView.frame = CGRect(
        x: 0,
        y: weekDaysView.frame.maxY,
        width: view.frame.width,
        height: view.frame.height * 0.6
      )
      calendarView.setup()
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}


extension CalendarViewController: VAMonthHeaderViewDelegate {
  
  func didTapNextMonth() {
    calendarView.nextMonth()
  }
  
  func didTapPreviousMonth() {
    calendarView.previousMonth()
  }
  
}

extension CalendarViewController: VAMonthViewAppearanceDelegate {
  
  func leftInset() -> CGFloat {
    return 10.0
  }
  
  func rightInset() -> CGFloat {
    return 10.0
  }
  
  func verticalMonthTitleFont() -> UIFont {
    return UIFont.systemFont(ofSize: 16, weight: .semibold)
  }
  
  func verticalMonthTitleColor() -> UIColor {
    return .black
  }
  
  func verticalCurrentMonthTitleColor() -> UIColor {
    return .red
  }
  
}

extension CalendarViewController: VADayViewAppearanceDelegate {
  
  func textColor(for state: VADayState) -> UIColor {
    switch state {
    case .out:
      return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
    case .selected:
      return .black
    case .unavailable:
      return .lightGray
    default:
      return .black
    }
  }
  
  func textBackgroundColor(for state: VADayState) -> UIColor {
    switch state {
    case .selected:
      return .white
    default:
      return .clear
    }
  }
  
  func shape() -> VADayShape {
    return .circle
  }
  
  func dotBottomVerticalOffset(for state: VADayState) -> CGFloat {
    switch state {
    case .selected:
      return -7
    default:
      return -7
    }
  }
  
}

extension CalendarViewController: VACalendarViewDelegate {
  func selectedDate(_ date: Date) {
    let nav = DetailCalendarViewController()
    navigationController?.pushViewController(nav, animated: true)
  }
}
