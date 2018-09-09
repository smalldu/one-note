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
  
  private let model = NoteBookModel()
  private var name: String = ""
  private var pwd: String = ""
  
  mutating func nameChange(_ text: String?){
    name = text ?? ""
  }
  
  mutating func pwdChange(_ text: String?){
    pwd = (text ?? "").md5
  }
  
  func check() -> Bool{
    if name.isEmpty {
      return false
    }
    return true
  }
  
  func save() {
    model.save(name, password: pwd)
  }
  
}


