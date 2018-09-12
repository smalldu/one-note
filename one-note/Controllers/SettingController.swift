//
//  SettingController.swift
//  one-note
//  设置页面
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layoutUI()
  }
  
}

extension SettingController {
  
  func layoutUI() {
    titleLabel.style(.title("SETTING"))
    tableView.basicsConfig()
    
    
  }
  
}

