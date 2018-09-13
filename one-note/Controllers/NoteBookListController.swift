//
//  ViewController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import Hero

/// 属性声明 与 生命周期
class NoteBookListController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  
  fileprivate var lastCell: NoteBookListCell?
  lazy var viewModel = NoteBookListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.didUpdate = { [weak self] deleted , inserted , updated in
      self?.collectionView.applyChanges(deletions: deleted, insertions: inserted, updates: updated)
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    viewModel.didUpdate = nil
  }
  
}

// MARK: - setup
extension NoteBookListController {
  
  func setup(){
    titleLabel.style(viewModel.titleStyle)
    addButton.style(.add)
    titleLabel.hero.id = HeroID.title
    addButton.hero.id = HeroID.close
    hero.isEnabled = true
    
    // 去掉tabbar 顶部的线条
    tabBarController?.tabBar.backgroundImage = UIImage()
    tabBarController?.tabBar.shadowImage = UIImage()
    
    collectionView.backgroundColor = UIColor.white
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
}

// MARK: - UICollectionViewDataSource

extension NoteBookListController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteBookListCell.identifier, for: indexPath) as! NoteBookListCell
    let noteBook = viewModel.books[indexPath.row]
    cell.configWith(noteBook)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.books.count
  }
  
}

// MARK: - UICollectionViewDelegate

extension NoteBookListController: UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let cell = collectionView.cellForItem(at: indexPath) as? NoteBookListCell{
      lastCell?.clearHero()
      cell.setHero()
      let noteBook = viewModel.books[indexPath.row]
      switch noteBook.bookType {
      case .imageNote:
        let controller = ImageNoteController(noteBook.name)
        self.present(controller, animated: true, completion: nil)
      case .note:
        let controller = NoteBookController(noteBook.name)
        self.present(controller, animated: true, completion: nil)
      }
      lastCell = cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width/2, height: 110)
  }
  
}















