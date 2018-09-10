//
//  CheckButton.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class CheckButton: UIButton {
  
  var checkedColor = UIColor.white
  var uncheckedColor = UIColor.white
  
  var checkedBackgroundColor = UIColor.body
  var unCheckedBackgroundColor = UIColor.remind
  
  var checked: Bool = false {
    didSet{
      if checked{
        self.normal_color = checkedColor
        self.backgroundColor = checkedBackgroundColor
      }else{
        self.normal_color = uncheckedColor
        self.backgroundColor = unCheckedBackgroundColor
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  convenience init() {
    self.init(frame: CGRect.zero)
    setup()
  }
  
  // 初始化
  func setup(){
    self.normal_color = uncheckedColor
    self.backgroundColor = unCheckedBackgroundColor
    self.titleLabel?.font = UIFont.regularOf(14)
    self.tintColor = UIColor.white
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

