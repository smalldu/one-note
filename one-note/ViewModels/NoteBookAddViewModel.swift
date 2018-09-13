//
//  NoteBookAddViewModel.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

struct NoteBookAddViewModel {
  
  private let _model = NoteBookModel()
  private var _name: String = ""
  private var _pwd: String = ""
  private var _type: NoteBook.BookType = .note
  
  mutating func typeChanged(_ type: NoteBook.BookType){
    _type = type
  }
  
  mutating func nameChange(_ text: String?){
    _name = text ?? ""
  }
  
  mutating func pwdChange(_ text: String?){
    _pwd = (text ?? "").md5
  }
  
  func check() -> Bool{
    if _name.isEmpty {
      return false
    }
    return true
  }
  
  func save() {
    _model.save(_name, password: _pwd, type: _type)
  }
  
}


