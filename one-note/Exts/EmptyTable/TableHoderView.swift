//
//  TableHoderView.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/6.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

enum EmptyType: EmptyHoderable {
  case notes
  case books
  
  var content: String {
    switch self {
    case .notes:
      return "No Notes"
    case .books:
      return "No Books"
    }
  }
}



public protocol EmptyHoderable {
  var content: String { get }
}


public class TableHoderView: UIView {

  fileprivate var imageView:UIImageView!
  fileprivate var messageLabel:UILabel!
  
  public init(type: EmptyHoderable ,frame: CGRect) {
    super.init(frame: frame )
    imageView = UIImageView()
    self.addSubview(imageView)
    messageLabel = UILabel()
    self.addSubview(messageLabel)
    messageLabel.textAlignment = .center
    messageLabel.text = type.content
    messageLabel.frame = CGRect(x: 0 , y: 200 , width: self.frame.width , height: 20)
    messageLabel.font = UIFont.lightOf(24)
    messageLabel.textColor = UIColor.remind
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
