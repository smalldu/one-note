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
  
  // 获取第一个image
  func getCoverData() -> Data? {
    let fullRange = NSRange(location: 0, length: self.length)
    var image: UIImage?
    self.enumerateAttribute(NSAttributedStringKey.attachment, in: fullRange, options: []) { (value, _, _) in
      guard let attachment = value as? NSTextAttachment else { return }
      if let img = attachment.image{
        image =  img
        return
      }
    }
    if let image = image {
      return UIImageJPEGRepresentation(image, 0.9)
    }else{
      return nil
    }
  }
  
}

