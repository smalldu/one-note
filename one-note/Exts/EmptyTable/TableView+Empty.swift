//
//  TableView+Empty.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/6.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

public extension UITableView {
  
  func basicsConfig(){
    tableFooterView = UIView()
    separatorInset = UIEdgeInsets.zero
    backgroundColor = UIColor.white
    separatorColor = UIColor.remind
  }
}

public extension UIScrollView {

  // MARK: -空table的解决方案
  
  public func whenEmpty(_ type:EmptyHoderable,rowCount:Int){
    for view in self.subviews {
      if view is TableHoderView{
        view.removeFromSuperview()
        break
      }
    }
    if rowCount == 0{
      //没有数据
      let hoderView = TableHoderView(type: type , frame: self.bounds )
      hoderView.frame.origin.y = 0
      hoderView.backgroundColor = self.backgroundColor
      self.addSubview(hoderView)
    }
  }
}


public extension UITableView {
  
  public func whenEmptyInBack(_ type: EmptyHoderable,rowCount:Int){
    for view in self.subviews {
      if view is TableHoderView{
        view.removeFromSuperview()
        break
      }
    }
    if rowCount == 0{
      //没有数据
      let hoderView = TableHoderView(type: type , frame: self.bounds )
      hoderView.frame.origin.y = 0
      hoderView.backgroundColor = self.backgroundColor
      self.backgroundView = hoderView
//      self.separatorStyle = .none
    }else{
      self.backgroundView = nil
//      self.separatorStyle = .singleLine
    }
  }
}

