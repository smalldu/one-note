//
//  ImageNote.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/12.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift


@objcMembers class ImageNote: Object {
  
  dynamic var id: String = UUID().uuidString
  dynamic var content: String?
  dynamic var data: Data?
  dynamic var width: Float = 0.0
  dynamic var height: Float = 0.0
  
  override static func primaryKey()-> String? {
    return "id"
  }
}
