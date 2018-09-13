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
  
  
  func shake(){
    let originBackColor = self.backgroundColor
    // 晃动
    UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .allowUserInteraction , animations: {
      self.backgroundColor = UIColor.red
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
        self.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/58) )
      })
      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5, animations: {
        self.transform = CGAffineTransform.identity.rotated(by: -CGFloat(Double.pi/58) )
      })
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.75, animations: {
        self.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/64) )
      })
      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1, animations: {
        self.transform = CGAffineTransform.identity.rotated(by: -CGFloat(Double.pi/64) )
      })
    }, completion: { b in
      self.transform = CGAffineTransform.identity
      self.backgroundColor = originBackColor
    })
    
  }
  
}
