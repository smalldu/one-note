//
//  UICollectionView+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

extension IndexPath {
  static fileprivate func fromRow(_ row: Int) -> IndexPath {
    return IndexPath(item: row, section: 0)
  }
}

extension UICollectionView {
  func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
    self.reloadData()
//    deleteItems(at: deletions.map(IndexPath.fromRow))
//    insertItems(at: insertions.map(IndexPath.fromRow))
//    reloadItems(at: updates.map(IndexPath.fromRow))
  }
}
