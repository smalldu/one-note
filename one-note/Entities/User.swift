//
//  User.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class User: Object{
  
  dynamic var id: String = UUID().uuidString
  dynamic var name: String = ""
  dynamic var password: String = ""
  
  let noteBooks = List<NoteBook>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}




