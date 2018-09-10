//
//  NoteBookListCell.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class NoteBookListCell: UICollectionViewCell {
  
  static let identifier = "noteBookListCell"
  
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var recordLabel: UILabel!
  @IBOutlet private weak var timeLabel: UILabel!
  @IBOutlet private weak var ctView: UIView!
  @IBOutlet private weak var lockView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setup()
  }
  
  func setup() {
    ctView.littleShadow()
    nameLabel.style(.cellTitle("每日一记"))
    recordLabel.style(.regular("988 条记录"))
    timeLabel.style(.time("16/08/1028"))
  }
  
  override var isHighlighted: Bool {
    didSet{
      ctView.layer.masksToBounds = isHighlighted
    }
  }
  
  func configWith(_ noteBook: NoteBook) {
    nameLabel.text = noteBook.name
    recordLabel.text = "\(noteBook.notes.count) 条记录"
    timeLabel.text = noteBook.createDate.toString()
    lockView.isHidden = !noteBook.isLock
    nameLabel.hero.id = nil
  }
  
  func setHero(){
    nameLabel.hero.id = HeroID.bookTitle
  }
  
  func clearHero(){
    nameLabel.hero.id = nil
  }

}
