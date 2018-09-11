//
//  NoteDetailController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class NoteDetailController: UIViewController {
  
  @IBOutlet private var closeButton: UIButton!
  @IBOutlet private var tableView: UITableView!
  
  let note: Note
  init(note: Note) {
    self.note = note
    super.init(nibName: "NoteDetailController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
}


// MARK: - setup

extension NoteDetailController {
  
  func setup(){
    view.backgroundColor = UIColor.white
    closeButton.style(.add)
    closeButton.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/4))
    closeButton.hero.id = HeroID.close
    hero.isEnabled = true
    
    
  }
  
}
