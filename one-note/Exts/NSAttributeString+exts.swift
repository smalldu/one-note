//
//  NSAttributeString+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension NSAttributedString {
  
  func toArchiveData() -> Data{
    return NSKeyedArchiver.archivedData(withRootObject: self)
  }
  
}

