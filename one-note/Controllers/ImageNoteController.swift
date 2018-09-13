//
//  ImageNoteController.swift
//  one-note
//  展示相册
//  Created by zuber on 2018/9/13.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import ImagePicker

class ImageNoteController: UIViewController {
  
  @IBOutlet weak var addButton: UIButton!
  
  let name: String
  init(_ name: String) {
    self.name = name
    super.init(nibName: "ImageNoteController", bundle: nil)
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
    setupGesture()
  }
  
}


// MARK: - setup

extension ImageNoteController: Gestureable {
  
  func setup() {
    addButton.style(.addNote)
    addButton.hero.modifiers = [ .translate(x: 0, y: 80, z: 0) ]
    
    addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
  }
  
}

// MARK: - operaters

extension ImageNoteController {
  
  @objc func add(){
    let imagePickerController = ImagePickerController()
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
  
}


// MARK: - ImagePickerDelegate

extension ImageNoteController: ImagePickerDelegate {
  
  func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    
  }
  
  func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    
  }
  
  func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
    
  }
}



