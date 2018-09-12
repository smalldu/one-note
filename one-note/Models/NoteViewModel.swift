//
//  NoteViewModel.swift
//  one-note
//
//  Created by zuber on 2018/9/12.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

class NoteViewModel {
  
  // 实际是更新bookNote
  func updateNote(_ note: Note ,block: ((Note)->())){
    let realm = RealmProvider.notes.realm
    try? realm?.write {
      block(note)
    }
  }
  
}
