//
//  Tool.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

struct Tool {
  
  static func hideKeyboard(){
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil)
  }
  
  //获取当前页面
  static func topViewController() -> UIViewController? {
    if let rootViewController = UIApplication.shared.keyWindow?.rootViewController{
      return topViewController(rootViewController: rootViewController)
    }else{
      return nil
    }
  }
  
  static func topViewController(rootViewController: UIViewController) -> UIViewController {
    if (rootViewController.isKind(of: UITabBarController.self)) {
      let tabBarController = rootViewController as! UITabBarController
      return topViewController(rootViewController: tabBarController.selectedViewController!)
    }
    if (rootViewController.isKind(of: UINavigationController.self)) {
      let navigationController = rootViewController as! UINavigationController
      return topViewController(rootViewController: navigationController.visibleViewController!)
    }
    if ((rootViewController.presentedViewController) != nil) {
      return topViewController(rootViewController: rootViewController.presentedViewController!)
    }
    return rootViewController
  }
  
  static func convertMonthToEnglish(_ month: Int) -> String{
    let monthMapping = [1:"JAN",2:"FEB",3:"MAR",4:"APR",5:"MAY",6:"JUN",7:"JUL",8:"AUG",9:"SEP",10:"OCT",11:"NOV",12:"DEC"]
    return monthMapping[month] ?? "JAN"
  }
}

