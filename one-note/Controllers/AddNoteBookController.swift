//
//  AddNoteBookController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import Hero

class AddNoteBookController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var fieldView: UIStackView!
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  lazy var viewModel = NoteBookAddViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }
}


// MARK: - setup

extension AddNoteBookController{
  
  func setup(){
    titleLabel.style(.title("New Notebook"))
    addButton.style(.add)
    addButton.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/4))
    submitButton.corner(2)
    submitButton.layer.shadowOpacity = 0.1
    submitButton.layer.shadowRadius = 2
    submitButton.layer.shadowOffset = CGSize(width: 0, height: 2)
    titleLabel.hero.id = HeroID.title
    addButton.hero.id = HeroID.close
    hero.isEnabled = true
    
    nameField.font = UIFont.regularOf(15)
    passwordField.font = UIFont.regularOf(15)
    nameField.configAccessoryView()
    passwordField.configAccessoryView()
    passwordField.isSecureTextEntry = true
    
    fieldView.hero.modifiers = [ .translate(x: 500, y: 0, z: 0) ]
    submitButton.hero.modifiers = [ .translate(x: 200, y: 0, z: 0) ]
    
    nameField.addTarget(self, action: #selector(nameDidChange(_:)), for: .allEditingEvents)
    passwordField.addTarget(self, action: #selector(pwdDidChange(_:)), for: .allEditingEvents)
  }
  
}


// MARK: - operaters

extension AddNoteBookController {
  
  @objc func nameDidChange(_ textField: UITextField){
    viewModel.nameChange(textField.text)
  }
  
  @objc func pwdDidChange(_ textField: UITextField){
    viewModel.pwdChange(textField.text)
  }
  
  @IBAction func close(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
 
  @IBAction func submit(_ sender: Any) {
    nameField.resignFirstResponder()
    passwordField.resignFirstResponder()
    
    guard viewModel.check() else {
      print("请填写。。。")
      return
    }
    self.dismiss(animated: true) { [weak self] in
      guard let `self` = self else { return }
      self.viewModel.save()
    }
  }
}










