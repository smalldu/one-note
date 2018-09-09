//
//  AddNoteController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class AddNoteController: UIViewController {
  
  @IBOutlet weak var closeButton: UIButton!
  
  
  init() {
    super.init(nibName: "AddNoteController", bundle: nil)
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

extension AddNoteController {
  
  func setup() {
    closeButton.style(.add)
    closeButton.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/4))
    closeButton.hero.id = HeroID.close
    hero.isEnabled = true
    
  }
  
}

// MARK: - operaters

extension AddNoteController {
  
  @IBAction func close(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
}

