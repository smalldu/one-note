//
//  TextPresentable.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

protocol TextPresentable {
  
  var text: String { get }
  var textColor: UIColor { get }
  var font: UIFont { get }
  
}


protocol ButtonPresentable {
  
  var normalText: String?{ get }
  var disabledText: String?{ get }
  var highlightedText: String?{ get }
  var normalImage: UIImage?{ get }
  var disabledImage: UIImage?{ get }
  var highlightedImage: UIImage?{ get }
  var font: UIFont { get }
  
}

extension ButtonPresentable{
  
  var normalText: String?{ return nil }
  var disabledText: String?{ return nil }
  var highlightedText: String?{ return nil }
  var normalImage: UIImage?{ return nil }
  var disabledImage: UIImage?{ return nil }
  var highlightedImage: UIImage?{ return nil }
  var font: UIFont { return UIFont.regularOf(17) }
  
}










