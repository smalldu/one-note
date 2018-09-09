//
//  RichEditorToolView.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import SnapKit

class RichEditorToolView: UIView {
  
  // 斜体 粗体 细体 下划线 中划线
  // 颜色
  enum `Type`{
    case text
    case format
    
    mutating func toggle() {
      if self == .text {
        self = .format
      }else{
        self = .text
      }
    }
    
    var image: UIImage {
      switch self {
      case .text:
        return #imageLiteral(resourceName: "format")
      case .format:
        return #imageLiteral(resourceName: "keyboard")
      }
    }
    
  }
  
  var type = Type.text
  
  
  lazy var midButton: UIButton = {
    let button = UIButton()
    button.normal_image = self.type.image
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let downButton: UIButton = {
    let button = UIButton()
    button.normal_image = #imageLiteral(resourceName: "tool_down")
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let saveButton: UIButton = {
    let button = UIButton()
    button.normal_color = UIColor.body
    button.normal_title = "保存"
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let photoButton: UIButton = {
    let button = UIButton()
    button.normal_image = #imageLiteral(resourceName: "photo").withRenderingMode(.alwaysOriginal)
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let stkView = UIStackView()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    prepareView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    prepareView()
  }
  
  func prepareView(){
    
    stkView.addArrangedSubview(photoButton)
    stkView.addArrangedSubview(saveButton)
    stkView.alignment = .center
    stkView.spacing = 20
    stkView.axis = .horizontal
    stkView.distribution = .fillProportionally
    
    addSubview(stkView)
    stkView.snp.makeConstraints { (make) in
      make.top.bottom.equalToSuperview()
      make.right.equalToSuperview().inset(20)
      make.width.equalTo(100)
    }
    addSubview(downButton)
    downButton.contentMode = .scaleAspectFit
    downButton.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(20)
      make.top.bottom.equalToSuperview()
    }
    downButton.addTarget(self, action: #selector(resign), for: .touchUpInside )
    
    addSubview(midButton)
    midButton.contentMode = .scaleAspectFit
    midButton.snp.makeConstraints { (make) in
      make.top.bottom.equalToSuperview()
      make.centerX.equalToSuperview()
    }
    midButton.addTarget(self, action: #selector(midClick), for: .touchUpInside )
  }
  
  @objc func resign(){
    Tool.hideKeyboard()
  }
  
  @objc func midClick(){
    type.toggle()
    midButton.normal_image = type.image
    switch type {
    case .format:
      break
    case .text:
      break
    }
  }
}


extension UITextView {
  
  
  func configRichToolBar(){
    let screenWith = UIScreen.main.bounds.width
    let toolView = RichEditorToolView(frame: CGRect(x: 0 ,y: 0 , width: screenWith , height: 40))
    toolView.backgroundColor = UIColor.white
    self.inputAccessoryView = toolView
  }
  
}



















