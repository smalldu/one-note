//
//  AuthorizationManager.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import Photos

class AuthorizationManager {
  
  static let shared = AuthorizationManager()
  
  // 相册
  public func authorizePhoto(shouldAlert: Bool = true, complete:@escaping ((_ b:Bool)->Void)){
    let status: PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    switch status {
    case .authorized:
      // 已经授权
      complete(true)
    case .notDetermined:
      // 还未决定 请求授权
      PHPhotoLibrary.requestAuthorization({ (status) -> Void in
        DispatchQueue.main.async(execute: { [weak self] in
          guard let `self` = self else{ return }
          self.authorizePhoto(complete: complete)
        })
      })
    default:
      // 去开启
      complete(false)
    }
  }
  
  
  // 相机
  public func authorizeCamera(shouldAlert: Bool = true, complete:@escaping ((_ b:Bool)->Void)){
    let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
    switch status {
    case .notDetermined:
      // 未决定
      AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (b) in
        complete(b)
      })
    case .authorized:
      // 已授权
      complete(true)
    default:
      // 拒绝
      complete(false)
    }
  }
}
