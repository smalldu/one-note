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
  @IBOutlet weak var textView: UITextView!
  
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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.textView.becomeFirstResponder()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.textView.resignFirstResponder()
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}


// MARK: - setup

extension AddNoteController {
  
  func setup() {
    closeButton.style(.add)
    closeButton.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/4))
    closeButton.hero.id = HeroID.close
    hero.isEnabled = true
    
    textView.configRichToolBar()
    
    NotificationCenter.default.addObserver(self, selector: #selector(updateTextLayout(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(updateTextLayout(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
  }
  
  
  // 自适应 contentInset
  @objc func updateTextLayout(_ notification:Notification){
    guard let rect = ((notification as NSNotification).userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
    guard rect.height > 0 else { return }
    let rectInView = self.view.convert(rect, from: view.window)
    
    if notification.name == .UIKeyboardWillHide {
      textView.contentInset = .zero
    }else{
      textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: rectInView.height-10, right: 0)
    }
    textView.scrollIndicatorInsets = textView.contentInset
    textView.scrollRangeToVisible(textView.selectedRange)
  }
}

// MARK: - operaters

extension AddNoteController {
  
  @IBAction func close(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
}

