//
//  DetailContentCell.swift
//  one-note
//
//  Created by zuber on 2018/9/11.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class DetailContentCell: UITableViewCell {
  
  @IBOutlet private weak var markLabel: UILabel!
  @IBOutlet private weak var contentTextView: UITextView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    backgroundColor = UIColor.clear
    markLabel.font = UIFont.copperplate(15)
    markLabel.textColor = UIColor.remind
    markLabel.text = "one note"
    contentTextView.backgroundColor = UIColor.clear
    self.hero.id = HeroID.notesCellContent
  }
  
  func configWith(_ note: Note) {
    if let attributeData = note.attributeContent , let attributeString = attributeData.toAttributeString(){
      contentTextView.attributedText = attributeString
    }
  }
  
  
}

