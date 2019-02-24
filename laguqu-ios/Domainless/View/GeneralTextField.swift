//
//  GeneralTextField.swift
//  mkg-ios
//
//  Created by Rizki Ramdani on 18/09/18.
//  Copyright © 2018 Nusantara Beta Studio. All rights reserved.
//

import UIKit
import SnapKit

enum TextFieldValidationType {
  case none
  case phone
  case email
  case minMaxCharNums(min: Int, max: Int)
  case minCharNums(min: Int)
}

class GeneralTextField: UITextField {
  
  private let infoLabel = UILabel(frame: .zero)
  
  var validationType: TextFieldValidationType = .none

  override var tintColor: UIColor! {
    didSet {
      setNeedsDisplay()
      if let label = value(forKey: "_placeholderLabel") as? UILabel {
        label.textColor = tintColor.withAlphaComponent(0.4)
      }
    }
  }
  
  var widthBorder: CGFloat = 2.0
  
  var icon: UIImage? {
    didSet {
      if let image = icon {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.height+10.0, height: frame.size.height))
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .center
        rightView = imageView
        rightViewMode = .always
      }
    }
  }
  
  var logoProvider: UIImage? {
    didSet {
      if let image = logoProvider {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height))
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFill
        rightView = imageView
        rightViewMode = .always
      }
    }
  }
  
  var infoText: String? {
    didSet {
      if infoText?.isEmpty ?? false {
        infoLabel.isHidden = true
      } else {
        infoLabel.isHidden = false
        infoLabel.text = infoText
      }
    }
  }
  
  let padding = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0);
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(bounds, padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(bounds, padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(bounds, padding)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    tintColor = UIColor.gray

    infoLabel.font = UIFont.systemFont(ofSize: 10)
    infoLabel.textColor = UIColor.red
    infoLabel.isHidden = true
    infoLabel.numberOfLines = 0
    addSubview(infoLabel)
    
    infoLabel.snp.makeConstraints { [weak self] (make) in
      guard let `self` = self else { return }
      make.top.equalTo(self.snp.bottom).offset(4)
      make.leading.trailing.equalToSuperview()
    }
    
  }

  override func draw(_ rect: CGRect) {
    let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
    let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
    
    let path = UIBezierPath()
    
    path.move(to: startingPoint)
    path.addLine(to: endingPoint)
    path.lineWidth = widthBorder
    
    tintColor.setStroke()
    
    path.stroke()
  }
}

