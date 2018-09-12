//
//  UITableView+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension IndexPath {
  static fileprivate func fromRow(_ row: Int) -> IndexPath {
    return IndexPath(row: row, section: 0)
  }
}

extension UITableView {
  
  func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
    
    if deletions.count == 0 && insertions.count == 0 && updates.count == 0{
      reloadData()
    }else{
      beginUpdates()
      if deletions.count > 0{
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
      }
      if insertions.count > 0{
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
      }
      if updates.count > 0{
        reloadRows(at: updates.map(IndexPath.fromRow), with: .automatic)
      }
      endUpdates()
    }
  }
  
}


public protocol ReusableView: class {}

public extension ReusableView where Self: UIView{
  
  public static var reuseIdentifier:String{
    return String(describing: self)
  }
  
}

extension UITableViewCell: ReusableView { }

public protocol NibLoadableView: class {}

public extension NibLoadableView where Self: UIView{
  public static var NibName: String{
    return String(describing: self)
  }
}

extension UITableViewCell: NibLoadableView { }

public extension UITableView{
  
  public func easyRegisterNib<T: UITableViewCell>(_: T.Type) {
    let Nib = UINib.init(nibName: T.NibName, bundle: nil)
    register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  public func easyRegisterClass<T: UITableViewCell>(_: T.Type) {
    register(T.self , forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  public func easyDequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell withidentifier : \(T.reuseIdentifier)")
    }
    return cell
  }
}
