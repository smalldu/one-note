//
//  Gestureable.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/12.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import Hero

protocol Gestureable {
}

extension Gestureable where Self: UIViewController {
  func setupGesture(){
    GestureTool.shared.owner = self
    GestureTool.shared.setup()
  }
}

class GestureTool {
  
  static let shared = GestureTool()
  weak var owner: UIViewController?
  
  func setup(){
    guard let view = owner?.view else { return }
    let panGesture = UIPanGestureRecognizer(target: self,action: #selector(handlePan(_:)))
    view.addGestureRecognizer(panGesture)
  }
  
  @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
    guard let view = owner?.view else { return }
    let translation = gesture.translation(in: nil)
    // 计算进度
    let progress = translation.x / 2 / view.bounds.width
    switch gesture.state {
    case .began:
      // 开始手势
      owner?.dismiss(animated: true, completion: nil)
    case .changed:
      Hero.shared.update(progress)
    default:
      if progress + gesture.velocity(in: nil).x / view.bounds.width > 0.3{
        Hero.shared.finish()
      }else{
        Hero.shared.cancel()
      }
    }
  }
  
}


