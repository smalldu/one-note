//
//  RichEditorToolView.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import SnapKit

protocol RichEditorToolViewDelegate: class {
  func richEditorToolViewDidClickSave(_ view: RichEditorToolView)
}

class RichEditorToolView: UIView {
  
  enum `Type`{
    case text
    case format
    
    mutating func toggle() {
      if self == .text {
        self = .format
      }else{
        self = .text
      }
    }
    
    var image: UIImage {
      switch self {
      case .text:
        return #imageLiteral(resourceName: "format")
      case .format:
        return #imageLiteral(resourceName: "keyboard")
      }
    }
  }
  
  weak var textView: UITextView?
  
  var type = Type.text
  var fontSize: CGFloat = 17
  
  lazy var midButton: UIButton = {
    let button = UIButton()
    button.normal_image = self.type.image
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let downButton: UIButton = {
    let button = UIButton()
    button.normal_image = #imageLiteral(resourceName: "tool_down")
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let saveButton: UIButton = {
    let button = UIButton()
    button.normal_color = UIColor.body
    button.normal_title = "保存"
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let photoButton: UIButton = {
    let button = UIButton()
    button.normal_image = #imageLiteral(resourceName: "photo").withRenderingMode(.alwaysOriginal)
    button.titleLabel?.font = UIFont.regularOf(15)
    return button
  }()
  
  let stkView = UIStackView()
  
  // 富文本格式选择view
  let textFormatView: RichTextFormatView = {
    let view = RichTextFormatView()
    view.frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: 270)
    return view
  }()
  
  // 照片选择器
  lazy var photoChooser: PhotoChooser = {
    let chooser = PhotoChooser()
    chooser.delegate = self
    return chooser
  }()
  
  weak var delegate: RichEditorToolViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    prepareView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    prepareView()
  }
  
  func prepareView(){
    
    stkView.addArrangedSubview(photoButton)
    stkView.addArrangedSubview(saveButton)
    stkView.alignment = .center
    stkView.spacing = 5
    stkView.axis = .horizontal
    stkView.distribution = .fillProportionally
    
    addSubview(stkView)
    stkView.snp.makeConstraints { (make) in
      make.top.bottom.equalToSuperview()
      make.right.equalToSuperview().inset(20)
      make.width.equalTo(80)
    }
    addSubview(downButton)
    downButton.contentMode = .scaleAspectFit
    downButton.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(20)
      make.top.bottom.equalToSuperview()
    }
    downButton.addTarget(self, action: #selector(resign), for: .touchUpInside )
    
    addSubview(midButton)
    midButton.contentMode = .scaleAspectFit
    midButton.snp.makeConstraints { (make) in
      make.top.bottom.equalToSuperview()
      make.centerX.equalToSuperview()
    }
    midButton.addTarget(self, action: #selector(midClick), for: .touchUpInside )
    photoButton.addTarget(self, action: #selector(insertPhoto), for: .touchUpInside )
    saveButton.addTarget(self, action: #selector(save), for: .touchUpInside )
    textFormatView.fontSize = self.fontSize
  }
  
  @objc func resign(){
    Tool.hideKeyboard()
  }
  
  @objc func midClick(){
    type.toggle()
    midButton.normal_image = type.image
    switch type {
    case .format:
      textFormatView.textView = self.textView
      self.textView?.inputView = textFormatView
    case .text:
      self.textView?.inputView = nil
    }
    UIView.animate(withDuration: 0.15) { [weak self] in
      guard let `self` = self else { return }
      self.textView?.reloadInputViews()
    }
  }
  
  @objc func save(){
    delegate?.richEditorToolViewDidClickSave(self)
  }
  
  // 添加图片
  @objc func insertPhoto() {
    // 调用系统相册
    AuthorizationManager.shared.authorizePhoto{ [weak self] b in
      guard let `self` = self else{ return }
      self.photoChooser.pickPhoto()
    }
  }
  
}



// MARK: - PhotoChooserDelegate

extension RichEditorToolView: PhotoChooserDelegate{
  
  func photoChooser(_ chooser: PhotoChooser, image: UIImage) {
    // 记录之前的 书写属性
    let typingAttribute = self.textView?.typingAttributes
    
    let attributeText = self.textView?.attributedText ?? NSAttributedString()
    let mutableAttributeText = NSMutableAttributedString(attributedString: attributeText)
    
    // 将图片作为属性字添加到最后
    let textAttachment = NSTextAttachment()
    let image = image.resizeWidthTo(UIScreen.width - 100)
    textAttachment.image = image
    textAttachment.bounds = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
    
    let textAttachmentString = NSAttributedString(attachment: textAttachment)
    mutableAttributeText.insert(textAttachmentString, at: attributeText.length)
    
    self.textView?.attributedText = mutableAttributeText
    self.textView?.typingAttributes = typingAttribute ?? [:]
  }
  
}

extension UITextView {
  
  func configRichToolBar(_ size: CGFloat) -> RichEditorToolView {
    let screenWith = UIScreen.main.bounds.width
    let toolView = RichEditorToolView(frame: CGRect(x: 0 ,y: 0 , width: screenWith , height: 40))
    toolView.backgroundColor = UIColor.white
    toolView.textView = self
    toolView.fontSize = size
    self.inputAccessoryView = toolView
    return toolView
  }
  
}



















