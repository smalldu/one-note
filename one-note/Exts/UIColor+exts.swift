//
//  UIColor+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(rgb: UInt) {
    self.init(
      red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgb & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
  static let body = UIColor(rgb: 0x484848)
  static let remind = UIColor(rgb: 0xb2b2b2)
  static let secondary = UIColor(rgb: 0x888888)
}
