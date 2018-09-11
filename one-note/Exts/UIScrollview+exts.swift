//
//  UIScrollview+exts.swift
//  one-note
//
//  Created by zuber on 2018/9/11.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit


extension UIScrollView {
  
  func createImage() -> UIImage{
    UIGraphicsBeginImageContextWithOptions(CGSize(width: contentSize.width, height:  contentSize.height), false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    let previousFrame = frame
    frame = CGRect(x: frame.origin.x, y:  frame.origin.y, width: contentSize.width, height: contentSize.height)
    layer.render(in: context!)
    frame = previousFrame
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
  }
  
}
