//
//  NoteBookViewModel.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

struct NoteBookViewModel {
  
  private let model = NoteBookModel()
  private var _book: NoteBook?
  private var _notesToken: NotificationToken?
  
  // 监听改变
  var didUpdate: ChangesCallback? = nil {
    didSet {
      guard let didUpdate = didUpdate,let _book = _book else {
        _notesToken?.invalidate()
        return
      }
      _notesToken = _book.notes.observe { changes in
        switch changes {
        case .initial:
          didUpdate([], [], [])
        case .update(_, let deletions, let insertions, let updates):
          didUpdate(deletions, insertions, updates)
        case .error: break
        }
      }
    }
  }
  
  var notes: [Note] {
    guard let _book = _book else { return  [] }
    return Array(_book.notes.sorted(byKeyPath: "createTime",ascending: false))
  }
  
  let name: String
  init(_ name: String) {
    self.name = name
  }
  
  mutating func retriveBook() {
    _book = model.bookWith(self.name)
  }
  
}

