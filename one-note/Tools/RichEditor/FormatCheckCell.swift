//
//  FormatCheckCell.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

protocol FormatCheckCellDelegate: class {
  func formatCheckCell(_ cell: FormatCheckCell,type: RichTextFormatView.RowType ,sigleCheckedAt index: Int, value: CheckView.CheckValue)
  func formatCheckCell(_ cell: FormatCheckCell,type: RichTextFormatView.RowType ,mutipleCheckedAt index: Int, value: CheckView.CheckValue, checked: Bool)
}

class FormatCheckCell: UITableViewCell {
  
  @IBOutlet private weak var leftLabel: UILabel!
  @IBOutlet private weak var rightLabel: UILabel!
  @IBOutlet private weak var checkView: CheckView!
  
  weak var delegate: FormatCheckCellDelegate?
  
  var rightValue: String = "" {
    didSet{
      rightLabel.text = rightValue
    }
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    leftLabel.style(.cellName("label"))
    checkView.delegate = self
    rightValue = ""
    rightLabel.font = UIFont.lightOf(15)
    rightLabel.textColor = UIColor.body
  }
  
  var type: RichTextFormatView.RowType?
  
  func config(_ type: RichTextFormatView.RowType){
    self.type = type
    checkView.allowCancelCheck = type.allowCancel
    checkView.allowMutipleSelected = type.allowMutipleSelected
    checkView.groups = type.group
    checkView.reloadItems()
    leftLabel.text = type.title
    
    switch type {
    case .size:
      rightLabel.isHidden = false
    default:
      rightLabel.isHidden = true
    } 
  }
  
  // 设置字体大小 
  func setFontSize(_ size: CGFloat){
    rightValue = "\(Int(size))"
    UIView.animate(withDuration: 0.2, animations: { [weak self] in
      self?.rightLabel.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
    }) { _ in
      UIView.animate(withDuration: 0.2, animations: { [weak self] in 
        self?.rightLabel.transform = CGAffineTransform.identity
      })
    }
  }
  
}


// MARK: - CheckViewDelegate

extension FormatCheckCell: CheckViewDelegate {
  
  func checkView(_ view: CheckView, sigleCheckedAt index: Int, value: CheckView.CheckValue) {
    guard let type = type else { return }
    delegate?.formatCheckCell(self, type: type, sigleCheckedAt: index, value: value)
  }
  
  func checkView(_ view: CheckView, mutipleCheckedAt index: Int, value: CheckView.CheckValue, checked: Bool) {
    guard let type = type else { return }
    delegate?.formatCheckCell(self, type: type, mutipleCheckedAt: index, value: value, checked: checked)
  }
  
}

