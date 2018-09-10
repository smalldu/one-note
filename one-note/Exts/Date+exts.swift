//
//  Date+exts.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit


extension Date{
  
  func toString(format: String = "dd/MM/yy" ) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
  
  func weekDay() -> Int{
    let interval = Int(self.timeIntervalSince1970)
    let days = Int(interval/86400)
    let weekday = ((days + 4) % 7 + 7) % 7
    return weekday
  }
  
  func formatedWeekDay()->String{
    let mapping = [1:"一",2:"二",3:"三",4:"四",5:"五",6:"六",7:"日"]
    return mapping[weekDay()] ?? "日"
  }
  
  // 获取年月日
  func ymd() -> (Int,Int,Int){
    let calendar = NSCalendar.current
    let com = calendar.dateComponents([.year,.month,.day]  , from: self)
    return (com.year ?? 0 ,com.month ?? 0,com.day ?? 0 )
  }
  
}


