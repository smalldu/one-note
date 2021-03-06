//
//  UIButton+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

enum ButtonStyle: ButtonPresentable{
  
  var normalImage: UIImage? {
    switch self {
    case .add:
      return #imageLiteral(resourceName: "add").withRenderingMode(.alwaysOriginal)
    case .addNote:
      return #imageLiteral(resourceName: "add_note").withRenderingMode(.alwaysOriginal)
    default:
      return nil
    }
  }
  var normalText: String? {
    switch self {
    case .submit:
      return "SUBMIT"
    default:
      return nil
    }
  }
  
  var font: UIFont {
    switch self {
    case .submit:
      return UIFont.mediumOf(18)
    default:
      return UIFont.regularOf(17)
    }
  }
  
  case add
  case submit
  case addNote
  
}

extension UIButton{
  
  func style(_ style: ButtonStyle){
    self.setTitle(style.normalText, for: .normal)
    self.setTitle(style.disabledText, for: .disabled)
    self.setTitle(style.highlightedText, for: .highlighted)
    
    self.setImage(style.normalImage, for: .normal)
    self.titleLabel?.font = style.font
  }
  
  var normal_title:String?{
    set(v){
      self.setTitle(v,for: UIControlState.normal)
    }
    get{
      return self.titleLabel?.text
    }
  }
  
  var normal_image:UIImage?{
    set(v){
      self.setImage(v, for: UIControlState.normal)
    }
    get{
      return self.imageView?.image
    }
  }
  
  var normal_color:UIColor?{
    set(v){
      self.setTitleColor(v, for: UIControlState.normal )
    }
    get{
      return self.titleLabel?.textColor
    }
  }
  
  
}


