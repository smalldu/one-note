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
  @IBOutlet private var bottomView: UIView!
  @IBOutlet private var downloadButton: UIButton!
  @IBOutlet private var editButton: UIButton!
  @IBOutlet private var bottomConstraint: NSLayoutConstraint!
  
  enum RowType{
    case head,content
  }
  
  var items: [RowType] = [.head,.content]
  var lastOffset: CGPoint = .zero
  var isBottomAnimating = false
  var isBottomShowing = false
  
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
    bottomView.hero.modifiers = [ .translate(x: 0, y: 40, z: 0)  ]
    hero.isEnabled = true
    tableView.basicsConfig()
    tableView.separatorStyle = .none
    tableView.easyRegisterNib(DetailHeadCell.self)
    tableView.easyRegisterNib(DetailContentCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    
    downloadButton.addTarget(self, action: #selector(download), for: .touchUpInside)
    editButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
  }
  
}


// MARK: - operaters

extension NoteDetailController {
  
  @objc func download(){
    // 截图tableview
    let image = tableView.createImage()
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
  }
  
  // 将图片保存到相册
  @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
    if let error = error {
      print(error.localizedDescription)
    } else {
      let ac = UIAlertController(title: "保存成功!", message: "", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "确定", style: .default))
      present(ac, animated: true)
    }
  }
  
  @objc func edit(){
    let controller = AddNoteController(pageType: .edit(note))
    present(controller, animated: true, completion: nil)
  }
}


// MARK: - UITableViewDataSource

extension NoteDetailController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch items[indexPath.row] {
    case .head:
      let cell = tableView.easyDequeueReusableCell(forIndexPath: indexPath) as DetailHeadCell
      cell.configWith(self.note)
      return cell
    case .content:
      let cell = tableView.easyDequeueReusableCell(forIndexPath: indexPath) as DetailContentCell
      cell.configWith(self.note)
      return cell
    }
  }
  
}


// MARK: - UITableViewDelegate

extension NoteDetailController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch items[indexPath.row] {
    case .head:
      return 100
    case .content:
      return UITableViewAutomaticDimension
    }
  }
  
}


// MARK: - bottomview handler

extension NoteDetailController {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > self.lastOffset.y{
      // 向下滑动 隐藏
      hideBottom()
    } else if scrollView.contentOffset.y < self.lastOffset.y{
      // 向上滑动 显示
      showBottom()
    }
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.lastOffset = scrollView.contentOffset
  }
  
  func showBottom(){
    guard !isBottomShowing && !isBottomAnimating else { return }
    isBottomAnimating = true
    bottomConstraint.constant = 0
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    }) { _ in
      self.isBottomShowing = true
      self.isBottomAnimating = false
    }
  }
  
  func hideBottom(){
    guard isBottomShowing && !isBottomAnimating else { return }
    isBottomAnimating = true
    bottomConstraint.constant = -40
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    }) { _ in
      self.isBottomShowing = false
      self.isBottomAnimating = false
    }
  }
  
}




















