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
  let user = LinkingObjects(fromType: User.self, property: "noteBooks")
  
  // 是否有密码
  var isLock: Bool {
    return !password.isEmpty
  }
  
  let notes = List<Note>()
  
  convenience init(_ name: String, password: String?) {
    self.init()
    self.name = name
    self.password = password ?? ""
  }
  
  override static func primaryKey() -> String? {
    return "name"
  }
}







