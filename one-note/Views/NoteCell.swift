//
//  NoteCell.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import EasyAtrribute

class NoteCell: UITableViewCell {
  
  @IBOutlet private weak var monthLabel: UILabel!
  @IBOutlet private weak var timeLabel: UILabel!
  @IBOutlet private weak var contentLabel: UILabel!
  @IBOutlet private weak var coverImageView: UIImageView!
  @IBOutlet private weak var ctView: UIView!
  @IBOutlet private weak var lineView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    coverImageView.contentMode = .scaleAspectFill
    coverImageView.clip()
    lineView.backgroundColor = UIColor.line
    ctView.backgroundColor = UIColor.white
    ctView.littleShadow()
    timeLabel.font = UIFont.regularOf(14)
    timeLabel.textColor = UIColor.body
    monthLabel.textColor = UIColor.lightBlue
    
    contentLabel.font = UIFont.lightOf(13)
    contentLabel.textColor = UIColor.body
    contentLabel.numberOfLines = 3
  }
  
  func configWith(_ note: Note){
    if let date = note.updateTime{
      let (_,month,day) = date.ymd()
      monthLabel.attributedText = "\(month)".attribute().ez_font(UIFont.regularOf(12))
        +
      " \(day)".attribute().ez_font(UIFont.regularOf(22))
      let time = date.toString(format: "HH:mm")
      timeLabel.text = "星期\(date.formatedWeekDay()) \(time)"
    }
    if let cover = note.coverImage, let image = UIImage(data: cover){
      coverImageView.image = image
    }else{
      coverImageView.image = nil
    }
    contentLabel.text = note.content
  }
  
}

