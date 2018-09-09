//
//  RealmProvider.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmProvider {
  
  let configuration: Realm.Configuration
  
  internal init(config: Realm.Configuration) {
    configuration = config
  }
  
  var realm: Realm? {
    return try? Realm(configuration: configuration)
  }
  
  // MARK: - Note realm
  private static let notessConfig = Realm.Configuration(
    fileURL: try! Path.inLibrary("notes.realm"),
    schemaVersion: 2,
    deleteRealmIfMigrationNeeded: true)
  
  public static var notes: RealmProvider = {
    return RealmProvider(config: notessConfig)
  }()
  
}


