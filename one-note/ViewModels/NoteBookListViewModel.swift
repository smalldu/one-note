//
//  NoteBookListViewModel.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

struct NoteBookListViewModel {
  
  private var _books: Results<NoteBook>?
  private var _booksToken: NotificationToken?
  
  private let model = NoteBookModel()
  var titleStyle = TextStyle.title("One Note")
  
  var books: [NoteBook] {
    guard let books = _books else { return  [] }
    return Array(books)
  }
  
  init() {
    _books = model.books()
  }
  
  //MARK: - 处理监听结果集发生改变的逻辑
  typealias DeletedIndex = Int
  typealias InsertedIndex = Int
  typealias UpdatedIndex = Int
  typealias ChangesCallback = ([DeletedIndex], [InsertedIndex], [UpdatedIndex]) -> Void
  
  var didUpdate: ChangesCallback? = nil {
    didSet {
      guard let didUpdate = didUpdate,let _books = _books else {
          _booksToken?.invalidate()
          return
      }
      
      _booksToken = _books.observe { changes in
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
  
  
}





