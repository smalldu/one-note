//
//  PhotoChooser.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices


protocol PhotoChooserDelegate: class {
  func photoChooser(_ chooser: PhotoChooser,image: UIImage)
}


class PhotoChooser: NSObject {
  
  weak var owner: UIViewController? // onwer controller
  weak var delegate: PhotoChooserDelegate?
  
  var allowsEditing: Bool = false
  
  override init() {
    super.init()
    self.owner = Tool.topViewController()
  }
  
  /// 拍照
  ///
  /// - Parameter front: 是否使用前置摄像头
  public func takePhoto(front: Bool = false,allowsEditing: Bool = false){
    self.allowsEditing = allowsEditing
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
      // 相机
      let imagePicker = UIImagePickerController() // 系统拍照
      imagePicker.sourceType = UIImagePickerControllerSourceType.camera
      imagePicker.delegate = self
      if front{
        imagePicker.cameraDevice = .front
      }else{
        imagePicker.cameraDevice = .rear
      }
      imagePicker.allowsEditing = allowsEditing
      self.owner?.present(imagePicker, animated: true, completion: nil)
    }
  }
  
  // 选择照片
  func pickPhoto(){
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
      let imagePicker = UIImagePickerController() // 系统拍照
      imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
      imagePicker.mediaTypes = [kUTTypeImage as String]
      imagePicker.delegate = self
      self.owner?.present(imagePicker, animated: true, completion: nil)
    }
  }
  
}

extension PhotoChooser: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
  
  // 完成
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    var imageSource = UIImagePickerControllerOriginalImage
    if self.allowsEditing {
      imageSource = UIImagePickerControllerEditedImage
    }
    if let image = info[imageSource] as? UIImage {
      self.delegate?.photoChooser(self, image: image)
    }
    self.owner?.dismiss(animated: true, completion: nil)
  }
  
  
}


