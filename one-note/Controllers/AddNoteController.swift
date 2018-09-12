//
//  AddNoteController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

class AddNoteController: UIViewController {
  
  enum PageType {
    case add(String)
    case edit(Note)
    
    var name: String {
      switch self {
      case .add(let name):
        return name
      default:
        return ""
      }
    }
  }
  
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var textView: KMPlaceholderTextView!
  var viewModel: AddNoteViewModel
  var editorToolView: RichEditorToolView?
  
  let pageType: PageType
  init(pageType: PageType) {
    self.pageType = pageType
    viewModel = AddNoteViewModel(pageType.name)
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
    setupGesture()
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

extension AddNoteController: Gestureable {
  
  func setup() {
    closeButton.style(.add)
    closeButton.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/4))
    closeButton.hero.id = HeroID.close
    textView.hero.id = HeroID.notesCellContent
    hero.isEnabled = true
    textView.placeholder = viewModel.placehoder
    textView.placeholderColor = UIColor.remind
    textView.textColor = UIColor.body
    textView.font = UIFont.regularOf(17)
    editorToolView = textView.configRichToolBar(17)
    editorToolView?.delegate = self
    textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
    
    renderPageIfNeeded()
    NotificationCenter.default.addObserver(self, selector: #selector(updateTextLayout(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(updateTextLayout(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
  }
  
  
  /// 编辑模式需要先赋值
  func renderPageIfNeeded(){
    switch pageType {
    case .edit(let note):
      if let attributeData = note.attributeContent,let attributeText = attributeData.toAttributeString() {
        self.textView.attributedText = attributeText
      }
    default:
      break
    }
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



// MARK: - RichEditorToolViewDelegate

extension AddNoteController: RichEditorToolViewDelegate {
  
  func richEditorToolViewDidClickSave(_ view: RichEditorToolView) {
    if self.textView.attributedText.string.isEmpty || self.textView.attributedText == nil{
      // TODO: tip
      return
    }
    let content = self.textView.attributedText.string
    let attributeDate = self.textView.attributedText.toArchiveData()
    let image = self.textView.attributedText.getCoverData()
    switch pageType {
    case .add:
      self.viewModel.save(content, attributeContent: attributeDate,image: image)
    case .edit(let note):
      self.viewModel.update(note) { (note) in
        note.content = content
        note.attributeContent = attributeDate
        note.coverImage = image
      }
    }
    
    self.dismiss(animated: true, completion: nil)
  }
  
}






















