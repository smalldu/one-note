//
//  DetailHeadCell.swift
//  one-note
//
//  Created by zuber on 2018/9/11.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class DetailHeadCell: UITableViewCell {
  
  @IBOutlet private weak var monthLabel: UILabel!
  @IBOutlet private weak var timeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    monthLabel.font = UIFont.copperplate(35)
    monthLabel.textColor = UIColor.body
    monthLabel.numberOfLines = 0
    
    timeLabel.textColor = UIColor.body
    timeLabel.font = UIFont.lightOf(15)
    timeLabel.numberOfLines = 0
    timeLabel.textAlignment = .right
    
    monthLabel.hero.id = HeroID.notesCellMonth
    timeLabel.hero.id = HeroID.notesCellWeek
  }
  
  func configWith(_ note: Note){
    if let date = note.updateTime{
      let (_,month,day) = date.ymd()
      monthLabel.text = "\(day) \n\(Tool.convertMonthToEnglish(month))"
      
      let time = date.toString(format: "HH:mm")
      timeLabel.text = "\(date.formatedWeekDay())\n\(time)"
//      yearLabel.text = "\(year)"
    }
  }
  
}

