//
//  Validation.swift
//  
//
//  Created by Asep Mulyana on 15/03/18.
//  Copyright © 2018 Asep Mulyana. All rights reserved.
//

import UIKit

enum ValidationType {
  case notEmpty
  case sameTo(value: String, name: String)
  
  func toMessage(name: String?) -> String {
    let prefix = name == nil ? "" : "\(name!) "
    switch self {
    case .notEmpty:
      return prefix + "tidak boleh kosong"
    case .sameTo(_, let theName):
      return prefix + "must be same to " + theName
    }
  }
  
  func evaluate(input: String?) -> Bool {
    guard let theInput = input else { return false }
    
    switch self {
    case .notEmpty:
      return !theInput.isEmpty
    case .sameTo(let value, _):
      return value == input
    }
  }
}

struct ValidationInput {
  var type: [ValidationType]
  var name: String?
  weak var control: UIControl?
}

enum ValidationResult {
  case valid
  case invalid(message: String, field: UIControl?)
}

typealias ValidationInputs = [ValidationInput]

struct Validation {
  static func validate(inputs: ValidationInputs) -> ValidationResult {
    for input in inputs {
      for validationType in input.type.enumerated() {
        if !validationType.element.evaluate(input: input.control?.value(forKey: "text") as? String) {
          let message = validationType.element.toMessage(name: input.name)
          return .invalid(message: message, field: input.control)
        }
      }
    }
    
    return .valid
  }
}
