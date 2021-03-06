//
//  AddNoteViewModel.swift
//  one-note
//
//  Created by zuber on 2018/9/10.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation


struct AddNoteViewModel {
  
  let placehoder = "写点什么..."
  private let _noteBookModel = NoteBookModel()
  private let _noteModel = NoteViewModel()
  
  private let _bookName: String
  
  init(_ name: String) {
    self._bookName = name
  }
  
  func save(_ content: String,attributeContent: Data?,image: Data?){
    _noteBookModel.saveNote(_bookName,content, attributeContent: attributeContent,image: image)
  }
  
  func update(_ note: Note,block: ((Note)->())){
    _noteModel.updateNote(note, block: block)
  }
  
}





