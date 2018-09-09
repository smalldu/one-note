//
//  NoteBookModel.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

class NoteBookModel {
  
  func books()-> Results<NoteBook>?{
    let realm = RealmProvider.notes.realm
    return  realm?.objects(NoteBook.self)
      .sorted(byKeyPath: "createDate", ascending: false)
  }
  
  func bookWith(_ name: String)-> NoteBook? {
    let realm = RealmProvider.notes.realm
    return realm?.object(ofType: NoteBook.self, forPrimaryKey: name)
  }
  
  func save(_ name: String, password: String?){
    let realm = RealmProvider.notes.realm
    let noteBook = NoteBook(name, password: password, user: nil)
    try? realm?.write {
      realm?.add(noteBook)
    }
  }
  
}


