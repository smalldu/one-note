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
  dynamic var attributeContent: Data?
  dynamic var coverImage: Data?
  dynamic var createTime: Date?
  dynamic var updateTime: Date?
  
  convenience init(_ content: String, attributeContent: Data?,image: Data?) {
    self.init()
    self.content = content
    self.attributeContent = attributeContent
    self.coverImage = image
    self.createTime = Date()
    self.updateTime = self.createTime
  }
  
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



