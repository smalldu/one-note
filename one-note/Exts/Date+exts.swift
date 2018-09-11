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
    let mapping = [1:"MON",2:"TUE",3:"WED",4:"THU",5:"FRI",6:"SAT",7:"SUN"]
    return mapping[weekDay()] ?? "日"
  }
  
  // 获取年月日
  func ymd() -> (Int,Int,Int){
    let calendar = NSCalendar.current
    let com = calendar.dateComponents([.year,.month,.day]  , from: self)
    return (com.year ?? 0 ,com.month ?? 0,com.day ?? 0 )
  }
  
}


