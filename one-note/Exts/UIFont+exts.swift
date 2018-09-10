//
//  UIFont+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension UIFont {

  static func lightOf(_ size:CGFloat) -> UIFont {
    if let font = UIFont(name: "PingFangSC-Light" , size: size){
      return font
    }else{
      return UIFont.systemFont(ofSize:size)
    }
  }
  
  static func regularOf(_ size:CGFloat) -> UIFont {
    if let font = UIFont(name: "PingFangSC-Regular" , size: size){
      return font
    }else{
      return UIFont.systemFont(ofSize:size)
    }
  }
  
  static func mediumOf(_ size:CGFloat)  -> UIFont {
    if let font = UIFont(name: "PingFangSC-Medium" , size: size){
      return font
    }else{
      return UIFont.boldSystemFont(ofSize: size)
    }
  }
  
  static func copperplate(_ size: CGFloat) -> UIFont{
    if let font = UIFont(name: "Copperplate" , size: size){
      return font
    }else{
      return UIFont.boldSystemFont(ofSize: size)
    }
  }
  
}


