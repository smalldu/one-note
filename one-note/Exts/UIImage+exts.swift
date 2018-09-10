//
//  UIImage+exts.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

public extension UIImage{
  
  //图像比例缩放
  public func scaleImage(_ scaleSize:CGFloat)->UIImage{
    UIGraphicsBeginImageContext(CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize))
    self.draw(in: CGRect(x: 0, y: 0, width: CGFloat( Int(self.size.width * scaleSize) + 1 ) , height: self.size.height * scaleSize + 1))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return scaledImage!
  }
  
  //自定长宽 相当于裁剪分辨率
  public func reSizeImage(_ toSize:CGSize)->UIImage{
    UIGraphicsBeginImageContext(toSize)
    self.draw(in: CGRect(x: 0, y: 0, width: toSize.width, height: toSize.height))
    let reSizeImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return reSizeImage!
  }
  
  
  /// 等比例裁剪分辨率
  ///
  /// - Parameter width: 指定最大宽度
  /// - Returns: UIImage
  public func resizeWidthTo(_ width: CGFloat) -> UIImage {
    if width >= size.width {
      return self
    }
    let heght = size.height * (width/size.width)
    print("裁剪分辨率后w,h:\(width),\(heght)")
    let newSize = CGSize(width: width, height: heght)
    return reSizeImage(newSize)
  }
  
  
}

