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
  
  @IBOutlet weak var radioView: UIStackView!
  @IBOutlet weak var noteButton: UIButton!
  @IBOutlet weak var imageNoteButton: UIButton!
  
  lazy var viewModel = NoteBookAddViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupGesture()
  }
}


// MARK: - setup

extension AddNoteBookController: Gestureable{
  
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
    
    noteButton.normal_title = " 笔记"
    noteButton.normal_color = UIColor.body
    imageNoteButton.normal_title = " 相册"
    imageNoteButton.normal_color = UIColor.body
    noteButton.titleLabel?.font = UIFont.regularOf(14)
    imageNoteButton.titleLabel?.font = UIFont.regularOf(14)
    
    radioView.hero.modifiers = [ .translate(x: -200, y: 0, z: 0) ]
    fieldView.hero.modifiers = [ .translate(x: -500, y: 0, z: 0) ]
    submitButton.hero.modifiers = [ .translate(x: 200, y: 0, z: 0) ]
    
    nameField.addTarget(self, action: #selector(nameDidChange(_:)), for: .allEditingEvents)
    passwordField.addTarget(self, action: #selector(pwdDidChange(_:)), for: .allEditingEvents)
    
    noteButton.addTarget(self, action: #selector(clickNote), for: .touchUpInside)
    imageNoteButton.addTarget(self, action: #selector(clickImageNote), for: .touchUpInside)
  }
  
}


// MARK: - operaters

extension AddNoteBookController {
  
  @objc func clickNote(){
    noteButton.normal_image = #imageLiteral(resourceName: "radio_checked")
    imageNoteButton.normal_image = #imageLiteral(resourceName: "radio_unchecked")
    viewModel.typeChanged(.note)
  }
  
  @objc func clickImageNote(){
    noteButton.normal_image = #imageLiteral(resourceName: "radio_unchecked")
    imageNoteButton.normal_image = #imageLiteral(resourceName: "radio_checked")
    viewModel.typeChanged(.imageNote)
  }
  
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
      nameField.shake()
      return
    }
    self.dismiss(animated: true) { [weak self] in
      guard let `self` = self else { return }
      self.viewModel.save()
    }
  }
}










