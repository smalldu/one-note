//
//  Data+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension Data {
  
  func toAttributeString() -> NSAttributedString?{
    if let attributeString = NSKeyedUnarchiver.unarchiveObject(with: self) as? NSMutableAttributedString {
      return attributeString
    }
    return nil
  }
  
}



