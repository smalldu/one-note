//
//  CheckView.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit


protocol CheckViewDelegate: class {
  func checkView(_ view: CheckView,sigleCheckedAt index: Int, value: CheckView.CheckValue)
  func checkView(_ view: CheckView,mutipleCheckedAt index: Int, value: CheckView.CheckValue,checked: Bool)
}

class CheckView: UIView {
  
  enum CheckValue {
    case image(UIImage)
    case text(String)
  }
  
  private var subcheckButtons: [CheckButton] = []
  
  // 是否允许取消选中
  var allowCancelCheck: Bool = false
  var groups: [CheckValue] = []
  var itemHeight: CGFloat = 34
  var itemFont = UIFont.regularOf(14)
  
  var itemWidth: CGFloat = 0
  var selfHeight: CGFloat = 0
  var innerSpace: CGFloat = 10
  
  var allowMutipleSelected = false // 允许多选  默认不允许

  var itemsInLines: CGFloat = 3
  
  weak var delegate: CheckViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    #if !TARGET_INTERFACE_BUILDER
    translatesAutoresizingMaskIntoConstraints = false
    #endif
    prepareView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    prepareView()
  }
 
  func prepareView() {
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if self.itemWidth == 0 {
      self.itemWidth = (self.bounds.width - innerSpace*(itemsInLines-1))/itemsInLines
    }
    self.layoutWith(self.bounds.width)
  }
  
  // 布局视图
  func layoutWith( _ totalWidth:CGFloat){
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    print("totalWidth : \(totalWidth)")
    
    for (index,button) in subcheckButtons.enumerated() {
      let viewWidth = self.itemWidth
      if x + viewWidth + innerSpace  > totalWidth{
        x = 0
        y += itemHeight+innerSpace
      }else{
        if index != 0{
          x = subcheckButtons[index-1].frame.maxX + innerSpace
        }
      }
      print(" y are  ---: \(y)")
      button.frame = CGRect(x: x, y: y, width: viewWidth, height: itemHeight)
    }
  }
  
  // 刷新 view
  
  func reloadItems(){
    // 先清空数据
    for view in subcheckButtons {
      view.removeFromSuperview()
    }
    subcheckButtons.removeAll()
    // 根据 group 生成 buttons
    for (index,group) in groups.enumerated() {
      let button = CheckButton()
      switch group {
      case .image(let image):
        button.normal_image = image
      case .text(let string):
        button.normal_title = string
      }
      button.titleLabel?.font = itemFont
      button.tag = 100+index
      button.addTarget(self, action: #selector(clickItem(_:)), for: .touchUpInside)
      subcheckButtons.append(button)
      self.addSubview(button)
    }
  }
  
  
  @objc func clickItem(_ sender: Any){
    if let button = sender as? CheckButton{
      let index = button.tag - 100
      
      if index >= 0 {
        if !allowMutipleSelected {
          // 单选 并且可以取消选中
          if !button.checked {
            // 将其他button设置为unchecked
            uncheckedAll()
            button.checked = true
          } else {
            if allowCancelCheck {
              // 如果允许取消选中的话
              button.checked = false
            }
          }
          delegate?.checkView(self, sigleCheckedAt: index, value: groups[index])
        }else{
          // 多选
          let checked = button.checked
          button.checked = !checked
          delegate?.checkView(self, mutipleCheckedAt: index, value: groups[index], checked: !checked)
        }
      }
    }
  }
  
  func uncheckedAll(){
    self.subcheckButtons.forEach { (button) in
      button.checked = false
    }
  }
  
  func singleChecked(at index:Int){
    if self.subcheckButtons.count > index{
      self.subcheckButtons.forEach { (button) in
        button.checked = false
      }
      self.subcheckButtons[index].checked = true
    }
  }
  
  // 多选
  func mutipleChecked(ids: [Int]){
    self.uncheckedAll()
    for i in ids{
      if self.subcheckButtons.count > i{
        self.subcheckButtons[i].checked = true
      }
    }
  }
}
