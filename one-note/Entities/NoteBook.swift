//
//  NoteBook.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class NoteBook: Object {
  
  dynamic var name: String = ""
  dynamic var password: String = ""
  dynamic var createDate: Date = Date()
  dynamic var _type: Int = 0
  
  enum BookType: Int{
    case note = 0
    case imageNote = 1
  }
  
  // book 类型
  var bookType: BookType {
    set { _type = newValue.rawValue }
    get { return BookType(rawValue: _type)! }
  }
  
  let user = LinkingObjects(fromType: User.self, property: "noteBooks")
  
  // 是否有密码
  var isLock: Bool {
    return !password.isEmpty
  }
  
  let notes = List<Note>()
  
  convenience init(_ name: String, password: String?, bookType: BookType) {
    self.init()
    self.name = name
    self.password = password ?? ""
    self.bookType = bookType
  }
  
  override static func primaryKey() -> String? {
    return "name"
  }
}







