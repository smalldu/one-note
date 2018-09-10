//
//  NoteDetailController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class NoteDetailController: UIViewController {
  
  @IBOutlet private var backButton: UIButton!
  @IBOutlet private var tableView: UITableView!
  
  init() {
    super.init(nibName: "NoteDetailController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    hero.isEnabled = true
    
  }
  
}

