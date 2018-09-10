//
//  UIView+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension UIView{
  
  @discardableResult
  func border(_ width: CGFloat) -> Self{
    self.layer.borderWidth = width
    return self
  }
  
  @discardableResult
  func border(_ color: UIColor) -> Self{
    self.layer.borderColor = color.cgColor
    return self
  }
  
  @discardableResult
  func corner(_ radius: CGFloat) -> Self{
    self.layer.cornerRadius = radius
    return self
  }
  
  @discardableResult
  func clip() -> Self {
    self.layer.masksToBounds = true
    return self
  }
  
  func littleShadow(){
    self.corner(2)
    self.layer.shadowOpacity = 0.1
    self.layer.shadowRadius = 2
    self.layer.shadowOffset = CGSize(width: 0, height: 0)
  }
  
}
