//
//  Date.swift
//  laguqu-ios
//
//  Created by Rizki Ramdani on 26/02/19.
//  Copyright © 2019 -. All rights reserved.
//

import Foundation

extension Date {
  static func getFormattedDate(string: String , formatter:String) -> String{
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "dd MMM yyyy"
    dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = formatter
    
    let date: Date? = dateFormatterGet.date(from: string)
    print("Date",dateFormatterPrint.string(from: date!)) // Feb 01,2018
    return dateFormatterPrint.string(from: date!);
  }
  
  init(dateString:String) {
    self = Date.iso8601Formatter.date(from: dateString)!
  }
  
  static let iso8601Formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate,
                               .withTime,
                               .withDashSeparatorInDate,
                               .withColonSeparatorInTime]
    return formatter
  }()
  
  func toString(withFormat format: String = "MMM dd, yyyy") -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(identifier: "Asia/Jakarta")
    dateFormatter.dateFormat = format
    let strMonth = dateFormatter.string(from: self)
    
    return strMonth
  }
  
}
