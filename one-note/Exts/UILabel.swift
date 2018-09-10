//
//  UILabel.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

enum TextStyle: TextPresentable{
  
  var text: String {
    switch self {
    case .title(let text):
      return text
    case .cellTitle(let text):
      return text
    case .regular(let text):
      return text
    case .time(let text):
      return text
    case .cellName(let text):
      return text
    }
  }
  
  var textColor: UIColor {
    switch  self {
    case .time:
      return .remind
    case .regular:
      return .secondary
    default:
      return .body
    }
  }
  
  var font: UIFont {
    switch self {
    case .title:
      return UIFont.copperplate(25)
    case .regular:
      return UIFont.regularOf(14)
    case .cellTitle:
      return UIFont.regularOf(18)
    case .time:
      return UIFont.lightOf(11)
    case .cellName:
      return UIFont.lightOf(15)
    }
  }
  
  case title(String)
  case cellTitle(String)
  case regular(String)
  case time(String)
  case cellName(String)
}

extension UILabel {
  
  func style(_ style: TextStyle){
    self.font = style.font
    self.textColor = style.textColor
    self.text = style.text
  }
  
}




