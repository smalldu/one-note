//
//  UITextField+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit


extension UITextField{
  
  func configAccessoryView(){
    let screenWith = UIScreen.main.bounds.width
    let topView = UIView(frame: CGRect(x: 0 ,y: 0 , width: screenWith , height: 40))
    topView.backgroundColor = UIColor.white
    let btn = UIButton()
    btn.addTarget(self, action: #selector(resignFirstResponder), for: .touchUpInside)
    btn.setTitle("Done", for: .normal)
    btn.setTitleColor(UIColor.body, for: .normal)
    btn.frame = CGRect(x: screenWith - 40 - 20, y: 0, width: 40, height: 40)
    btn.titleLabel?.font = UIFont.mediumOf(15)
    topView.addSubview(btn)
    self.inputAccessoryView = topView
  }
  
  
  
}
