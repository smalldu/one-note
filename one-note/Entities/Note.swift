//
//  Note.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Note: Object {
  
  dynamic var id: String = UUID().uuidString
  dynamic var content: String = ""
  dynamic var createTime: String = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

@objcMembers class ImageNote: Object {
  
  dynamic var id: String = UUID().uuidString
  dynamic var data: Data?
  
  override static func primaryKey() -> String? {
    return "id"
  }
}



