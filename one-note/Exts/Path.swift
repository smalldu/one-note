//
//  Path.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation

class Path {
  static func inLibrary(_ name: String) throws -> URL {
    return try FileManager.default
      .url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      .appendingPathComponent(name)
  }
  
  static func inDocuments(_ name: String) throws -> URL {
    return try FileManager.default
      .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      .appendingPathComponent(name)
  }
  
  static func documents() throws -> URL {
    return try FileManager.default
      .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
  }
}
