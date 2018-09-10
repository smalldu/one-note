//
//  RichTextFormatView.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices

class RichTextFormatView: UIView {
  
  enum RowType {
    case alignment
    case font   // 字体 粗体 细体 常规
    case size
    case style
    case color
    
    var title: String {
      switch self {
      case .alignment:
        return "对齐"
      case .font:
        return "粗细"
      case .size:
        return "大小"
      case .style:
        return "样式"
      case .color:
        return "颜色"
      }
    }
    
    var group: [CheckView.CheckValue] {
      switch self {
      case .alignment:
        return [.image(#imageLiteral(resourceName: "f_justify_left")) , .image(#imageLiteral(resourceName: "f_justify_center")),.image(#imageLiteral(resourceName: "f_justify_right"))]
      case .font:
        return [.text("细") , .text("常规"), .text("粗")]
      case .size:
        return [.text("T+") , .text("T-")]
      case .style:
        return [ .image(#imageLiteral(resourceName: "f_italic")),.image(#imageLiteral(resourceName: "f_underline")),.image(#imageLiteral(resourceName: "f_strikethrough"))]
      case .color:
        return [.text("红") , .text("蓝")]
      }
    }
    
    var allowCancel: Bool {
      switch self {
      case .style:
        return true
      default:
        return false
      }
    }
    
    var allowMutipleSelected: Bool {
      switch self {
      case .style:
        return true
      default:
        return false
      }
    }
  }
  
  
  enum FontMode {
    case bold
    case normal
    case thin
    
    func fontValue(_ size: CGFloat) -> Any{
      switch self {
      case .thin:
        return UIFont.lightOf(size)
      case .bold:
        return UIFont.mediumOf(size)
      case .normal:
        return UIFont.regularOf(size)
      }
    }
  }
  
  let items: [RowType] = [
    .alignment , .font , .size ,.style ,.color
  ]
  var fontSize: CGFloat = 17 {
    didSet{
      textView?.typingAttributes[NSAttributedStringKey.font.rawValue] = fontMode.fontValue(fontSize)
    }
  }
  
  private var fontMode: FontMode = .normal {
    didSet{
      textView?.typingAttributes[NSAttributedStringKey.font.rawValue] = fontMode.fontValue(fontSize)
    }
  }
  
  let tableView: UITableView = {
    let tbView = UITableView()
    tbView.backgroundColor = UIColor.white
    tbView.separatorStyle = .none
    return tbView
  }()
  
  weak var textView: UITextView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    prepareView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    prepareView()
  }
  
  func prepareView() {
    backgroundColor = UIColor.white
    addSubview(tableView)
    tableView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    tableView.easyRegisterNib(FormatCheckCell.self)
    tableView.dataSource = self
    tableView.isScrollEnabled = false
    tableView.showsVerticalScrollIndicator = false
    tableView.rowHeight = 50
  }
  
}


// MARK: - UITableViewDataSource

extension RichTextFormatView: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.easyDequeueReusableCell(forIndexPath: indexPath) as FormatCheckCell
    let type = items[indexPath.row]
    cell.config(type)
    cell.delegate = self
    return cell
  }
  
}


// MARK: - FormatCheckCellDelegate

extension RichTextFormatView: FormatCheckCellDelegate{
  
  /// 单选
  func formatCheckCell(_ cell: FormatCheckCell, type: RichTextFormatView.RowType, sigleCheckedAt index: Int, value: CheckView.CheckValue) {
    guard let textView = textView else { return }
    switch type {
    case .alignment:
      switch index{
      case 0:
        textView.textAlignment = .left
      case 1:
        textView.textAlignment = .center
      case 2:
        textView.textAlignment = .right
      default:break
      }
    case .font:
      switch index {
      case 0:
        fontMode = .thin
      case 1:
        fontMode = .normal
      case 2:
        fontMode = .bold
      default:break
      }
    case .size:
      switch index{
      case 0:
        fontSize = min(fontSize + 1, 30)
      case 1:
        fontSize = max(fontSize - 1, 7)
      default:break
      }
      cell.setFontSize(fontSize)
    default:
      break
    }
  }
  
  
  /// 多选
  func formatCheckCell(_ cell: FormatCheckCell, type: RichTextFormatView.RowType, mutipleCheckedAt index: Int, value: CheckView.CheckValue, checked: Bool) {
    guard let textView = textView else { return }
    switch type {
    case .style:
      switch index{
      case 0:
        // 斜体
        if checked {
          textView.typingAttributes[NSAttributedStringKey.obliqueness.rawValue] = 0.3
        }else{
          textView.typingAttributes[NSAttributedStringKey.obliqueness.rawValue] = 0
        }
      case 1:
        // 下划线
        if checked {
          textView.typingAttributes[NSAttributedStringKey.underlineStyle.rawValue] = NSUnderlineStyle.styleSingle.rawValue
        }else{
          textView.typingAttributes[NSAttributedStringKey.strikethroughStyle.rawValue] = NSUnderlineStyle.styleNone.rawValue
        }
      case 2:
        // 中划线
        if checked {
          textView.typingAttributes[NSAttributedStringKey.strikethroughStyle.rawValue] = 1
        }else{
          textView.typingAttributes[NSAttributedStringKey.strikethroughStyle.rawValue] = 0
        }
      default:break
      }
    default:
      break
    }
  }
  
}


















