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
  dynamic var user: User?
  
  // 是否有密码
  var isLock: Bool {
    return !password.isEmpty
  }
  
  let notes = List<Note>()
  
  convenience init(_ name: String, password: String?,user: User?) {
    self.init()
    self.name = name
    self.password = password ?? ""
    self.user = user
  }
  
  override static func primaryKey() -> String? {
    return "name"
  }
}







