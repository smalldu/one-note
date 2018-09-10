//
//  NoteBookViewModel.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation

struct NoteBookViewModel {
  
  private let model = NoteBookModel()
  private var _book: NoteBook?
  
  var notes: [Note] {
    guard let _book = _book else { return  [] }
    return Array(_book.notes)
  }
  
  let name: String
  init(_ name: String) {
    self.name = name
  }
  
  mutating func retriveBook() {
    _book = model.bookWith(self.name)
  }
  
}

